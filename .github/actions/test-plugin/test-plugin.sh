#!/bin/bash
# Assumes pwd == git root

set -e

workflow="$1"
workflow_case="$2"
pause_seconds="$3"

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
    sleep "$pause_seconds"
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

install_build_tools
build_collector
build_agent_image
pause_for_logs
stop_agent
dump_agent_logs
test_failed_process_entry
test_empty_output