#!/bin/bash
#
# Migrate installation script
#
# https://github.com/mattes/migrate
#

set -e

VERSION="v3.0.0-rc2"

# TODO: remove Go dependency
OS_ARCH=`go env GOHOSTOS`-`go env GOHOSTARCH`

curl -L -s https://github.com/mattes/migrate/releases/download/${VERSION}/migrate.${OS_ARCH}.tar.gz > /tmp/migrate.tar.gz
mkdir -p /tmp/migrate
tar --directory=/tmp/migrate -xvf /tmp/migrate.tar.gz
cp /tmp/migrate/migrate.${OS_ARCH} $HOME/bin/migrate

rm -rf /tmp/migrate.tar.gz /tmp/migrate/
