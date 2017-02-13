#!/bin/bash

set -e

ACTUAL_VERSION=`docker-compose version --short`

if [[ $ACTUAL_VERSION != $1 ]]; then
    echo "Docker Compose version not found or incorrect"
    echo "Found: $ACTUAL_VERSION"
    echo "Expected: $1"
    exit 1
fi
