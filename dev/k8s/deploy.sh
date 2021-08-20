#!/usr/bin/env bash

# Run this script from the root of the repo to create a configmap
# containing all of your local plugins, as well as re-deploying your agent

set -e

plugin_configmap() {
    kubectl delete configmap plugin || true

    args=""
    for f in plugins/*yaml; do
        args+="--from-file ${f} "
    done

    eval kubectl create configmap plugin "$args"
}

pipeline_configmap() {
    kubectl delete configmap stanza-config || true
    kubectl create configmap stanza-config \
        --from-file dev/k8s/config.yaml
}

deploy() {
    kubectl delete -f dev/k8s/daemonset.yaml || true
    kubectl apply -f dev/k8s/daemonset.yaml
    kubectl rollout status ds/stanza
}

plugin_configmap
pipeline_configmap
deploy