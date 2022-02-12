#!/bin/bash
# Assumes pwd == git root

set -e

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

build_agent_iamge() {
    docker build . -t agent:latest -f .github/Dockerfile
}

install_build_tools
build_collector
build_agent_iamge