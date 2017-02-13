#!/bin/bash

set -e

EXPECTED_VERSION=`curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name'`
ACTUAL_VERSION=`docker-compose version --short`

if [[ $ACTUAL_VERSION != $EXPECTED_VERSION ]]; then
    echo "Docker Compose version not found or incorrect"
    echo "Found: $ACTUAL_VERSION"
    echo "Expected: $EXPECTED_VERSION"
    exit 1
fi
