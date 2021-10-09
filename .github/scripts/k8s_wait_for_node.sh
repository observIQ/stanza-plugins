#!/usr/bin/env bash

set -eE

NODE="$1"

fail () {
    kubectl describe nodes
    kubectl get node "${node}"
    exit 1
}
trap fail ERR

echo "waiting for node: ${node}"
kubectl get node "${node}"
kubectl wait --for=condition=Ready --timeout=60s "node/${node}"