#!/bin/sh

(sleep 2; geth --exec 'loadScript("/geth/setup.js")' attach http://localhost:8545)&
geth \
  --datadir /geth/data \
  --networkid 53371 \
  --dev \
  --dev.period 5 \
  --allow-insecure-unlock \
  --http \
  --http.addr 0.0.0.0 \
  --http.api admin,clique,debug,eth,miner,personal,txpool \
  --http.corsdomain '*' \
  --http.vhosts '*' \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.api admin,clique,debug,eth,miner,personal,txpool \
  --ws.origins '*'
