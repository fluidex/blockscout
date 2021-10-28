#!/bin/sh

set -ex

cd /usr/src/blockscout

./run-once.sh && exec mix phx.server