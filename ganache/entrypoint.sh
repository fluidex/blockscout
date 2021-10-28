#!/bin/sh

node /app/ganache-core.docker.cli.js \
    --host 0.0.0.0 \
    --networkId 53371 \
    --chainId 53371 \
    --db /ganache/db \
    --gasPrice 50000000000 \
    --gasLimit 1050000000000000 \
    --allowUnlimitedContractSize \
    --accounts 20 \
    --defaultBalanceEther 1000 \
    --deterministic \
    --mnemonic="$MNEMONIC"