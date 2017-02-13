#!/bin/bash
#
# Docker Compose installation script
# See: http://elliot.land/post/using-docker-compose-on-travis-ci
#

set -e

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install Docker Engine
# TODO: this step is a bit unstable (does not run perfectly on all systems)
apt-get -qq update
apt-get -qq install -o Dpkg::Options::="--force-confold" --force-yes -y docker-engine

# Check if there is a previous version
if command -v docker-compose 2>/dev/null; then
    echo "Previous docker-compose:"
    docker-compose --version
    rm /usr/local/bin/docker-compose
fi

# Detect version
if [[ $1 ]]; then
    VERSION="$1"
else
    apt-get install jq
	VERSION=`curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name'`
fi

echo "Installing Docker Compose version: ${VERSION}"

# Download and install Docker Compose
curl -L -s https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin
docker-compose --version
