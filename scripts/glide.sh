#!/bin/bash
#
# Glide installation script
#

set -e

# Detect version
if [[ $1 ]]; then
    VERSION="v$1"
else
	VERSION=`curl -s https://glide.sh/version`
fi

OS_ARCH=`go env GOHOSTOS`-`go env GOHOSTARCH`

curl -L -s https://github.com/Masterminds/glide/releases/download/${VERSION}/glide-${VERSION}-${OS_ARCH}.tar.gz > /tmp/glide.tar.gz
mkdir -p /tmp/glide
tar --directory=/tmp/glide -xvf /tmp/glide.tar.gz
cp /tmp/glide/${OS_ARCH}/glide $HOME/bin

rm -rf /tmp/glide.tar.gz /tmp/glide/
