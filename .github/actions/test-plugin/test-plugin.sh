#!/bin/bash
# Assumes pwd == git root

set -e

workflow="$1"
workflow_case="$2"
pause_time="$3"
k8s="$4"
k8s_version="$5"
k8s_runtime="$6"

minikube_install() {
    sudo apt-get update -qq
    sudo apt-get install -qq -y conntrack
    curl -s -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
}

minikube_start() {
    minikube start \
        --driver=docker \
        --kubernetes-version="$k8s_version" \
        --container-runtime="$k8s_runtime"
}

minikube_wait() {
    node=$(kubectl get node | grep -v NAME | awk '{print $1}')
    bash ./.github/scripts/k8s_wait_for_node.sh "$node"
}

minikube_load_image() {
    minikube image load agent:latest
}

minikube_create_configmap() {
    # TODO(jsirianni): Configmap should be dynamic, right now we are hardcoding the input files
    kubectl create configmap logs \
        --from-file="log-library/cases/${workflow}/${workflow_case}/logs/adservice-5657f795f5-ql97m_default_server-2180fc6125cb444bd32be19cfa73e71a25e5d6c98b59b5191ee51fc6ff6c6723.log" \
        --from-file="log-library/cases/${workflow}/${workflow_case}/logs/example-json-logger-6b49dd876-xmr2j_default_logger-ebd483078a72e8c029757f27d872b238ac26e1d0c8c7d842415790c33cc24451.log" \
        --from-file="log-library/cases/${workflow}/${workflow_case}/logs/productcatalogservice-7cdd54f7c7-nbsgt_default_server-0a3bc17f1a059f850fc35b8b947fcb2f1a7a726b2574f48c973015e49df47e59.log"
}

minikube_generate_manifest() {
# TODO(jsirianni): Configmap should be dynamic, right now we are hardcoding the input files
cat <<- EOF > deploy.yaml
---
kind: ServiceAccount
apiVersion: v1
metadata:
  name: stanza-metadata
  namespace: default
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: stanza-metadata
  namespace: default
rules:
- apiGroups: ["", "apps", "batch"]
  resources: ["pods", "namespaces", "replicasets", "jobs"]
  verbs: ["get", "list"]
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: stanza-metadata
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: stanza-metadata
subjects:
- kind: ServiceAccount
  name: stanza-metadata
  namespace: default
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: agent
  labels:
    app: agent
spec:
  replicas: 1
  selector:
    matchLabels:
      app: agent
  template:
    metadata:
      labels:
        app: agent
    spec:
      serviceAccountName: stanza-metadata
      containers:
      - name: agent
        image: agent:latest
        imagePullPolicy: IfNotPresent
        volumeMounts:
        - name: logs
          mountPath: /var/log/containers/adservice-5657f795f5-ql97m_default_server-2180fc6125cb444bd32be19cfa73e71a25e5d6c98b59b5191ee51fc6ff6c6723.log
          subPath: adservice-5657f795f5-ql97m_default_server-2180fc6125cb444bd32be19cfa73e71a25e5d6c98b59b5191ee51fc6ff6c6723.log
        - name: logs
          mountPath: /var/log/containers/example-json-logger-6b49dd876-xmr2j_default_logger-ebd483078a72e8c029757f27d872b238ac26e1d0c8c7d842415790c33cc24451.log
          subPath: example-json-logger-6b49dd876-xmr2j_default_logger-ebd483078a72e8c029757f27d872b238ac26e1d0c8c7d842415790c33cc24451.log
        - name: logs
          mountPath: /var/log/containers/productcatalogservice-7cdd54f7c7-nbsgt_default_server-0a3bc17f1a059f850fc35b8b947fcb2f1a7a726b2574f48c973015e49df47e59.log
          subPath: productcatalogservice-7cdd54f7c7-nbsgt_default_server-0a3bc17f1a059f850fc35b8b947fcb2f1a7a726b2574f48c973015e49df47e59.log
      volumes:
      - name: logs
        configMap:
          name: logs
EOF
}

install_build_tools() {
    echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list
    sudo apt-get update -qq
    sudo apt-get --no-install-recommends install -qq -y goreleaser
}

build_collector() {
    cd observiq-collector
    make collector
    cd ../
}

build_agent_image() {
    docker build . \
        --build-arg input_dir="log-library/cases/${workflow}/${workflow_case}" \
        -t agent:latest \
        -f .github/Dockerfile
}

run_agent() {
    if "$k8s"; then
        kubectl apply -f deploy.yaml
        sleep 10 && kubectl get pods
        pod=$(kubectl get pods | grep agent | awk '{print $1}')
        kubectl describe pod "${pod}"
        kubectl logs "${pod}"
        kubectl rollout status -w deployment/agent --timeout=60s

    else
        docker run -d --name agent agent:latest
        sleep 1 && docker logs agent

    fi
}

# pause to let agent parse logs
pause_for_logs() {
    sleep "$pause_time"
}

stop_agent() {
    if "$k8s"; then
        # We cannot stop the agent because we need its log output
        echo "skipping stop agent, running in k8s"
    else
        docker kill agent
    fi
}

dump_agent_logs() {
    if "$k8s"; then
        kubectl logs deploy/agent > agent.out 2>&1
    else
        docker logs agent > agent.out 2>&1
    fi

    cat agent.out
}

test_failed_process_entry() {
    # TODO(jsirianni): Handle k8s metadata or disable it via config?
    # It will always cause failures when looking up pods that do not exist, this is okay
    # for now.
    if grep -v 'k8s_metadata_decorator' agent.out | grep -i 'Failed to process entry'; then
        echo "Failed check: Ensure no 'Failed to process entry' in agent log"
        exit 1
    else 
        echo "Passed check: Ensure no 'Failed to process entry' in agent log"
    fi
}

test_empty_output() {
    mkdir -p output
    if "$k8s"; then
        kubectl cp deploy/agent:/output/out output/out
    else
        docker cp agent:/output/out output/out
    fi

    if [ -s output/out ]; then
        lines=$(wc -l output/out)
        echo "Passed check: Ensure output file is not empty. Number of lines: ${lines}"
    else
        echo "Failed check: Ensure output file is not empty."
        exit 1
    fi
}

### Main ###

install_build_tools
build_collector
build_agent_image

if "$k8s"; then
    minikube_install
    minikube_start
    minikube_wait
    minikube_load_image
    minikube_create_configmap
    minikube_generate_manifest
fi

run_agent
pause_for_logs
stop_agent
dump_agent_logs
test_failed_process_entry
test_empty_output