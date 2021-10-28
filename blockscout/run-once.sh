#!/bin/sh

if [ ! -d "/usr/src/blockscout/inited" ]; then
    mix do ecto.create, ecto.migrate
    touch /usr/src/blockscout/inited
fi
