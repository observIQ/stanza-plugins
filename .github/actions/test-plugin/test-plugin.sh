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
    docker build . -t agent:latest -f .github/Dockerfile
}

run_agent() {
    docker run -d \
        --name agent \
        -v "$(pwd)/log-library/cases/${workflow}/${workflow_case}:/input" \
        -v "$(pwd)/output:/output" \
        agent:latest --config /input/config/collector.yaml

    sleep 1 && docker logs agent
}

# pause to let agent parse logs
pause_for_logs() {
    sleep "${pause_time}s"
}

stop_agent() {
    docker kill agent
}

dump_agent_logs() {
    docker logs agent > agent.out 2>&1
    cat agent.out
}

test_failed_process_entry() {
    if grep -i 'Failed to process entry' agent.out; then
        exit 1
    else 
        echo "Passed check for failed to process entry"; 
    fi
}

test_empty_output() {
    if [ -s output/out ]; then
        echo "Passed check for empty output file"
    else
        exit 1
    fi
}

### Main ###

if "$k8s"; then
    minikube_install
    minikube_start
    minikube_wait
    minikube_load_image
    minikube_create_configmap
fi

install_build_tools
build_collector
build_agent_image
run_agent
pause_for_logs
stop_agent
dump_agent_logs
test_failed_process_entry
test_empty_output