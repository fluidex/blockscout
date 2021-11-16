#!/usr/bin/env sh
set -ex

addresses="0x3577C97DA04A1cf179bcf651Cb41fbDD1B3e4E43,0xCc763A4eAbe1EA0629cEC5Dd8789bD80f5f2B8E2,0xf3E6f862844c9b2bc064485E657636761EbDdd42,0x4C8Aaf5fA16383EcE728F87215944282C0b3dF5e,0xE70632A1af6d02f8B289C840a255921fb85B3aBa,0x0bF3Dabd2960e57C2C2080D617942575D3b44eF0,0x6322d578540162df9D0A6246A3CfafD09869a648,0x2917BDC1B6B1C6E8d1bDf44E2667B0dB0DFaa913,0xf12a0Fc715f214d0FC8b8B9FCd3236BBC849a1e6,0x8044095db5AD1bb91eD9e3fc60D009995B0d3CA2,0x1dDF3877Af5E7fCBF8D2C4f2BbE93fE1290C8E39,0xf65288232d80f1E4325D8dD5A0B82F4aC67b2BAb,0x1267596F9B2ef01999Ce2016344FbdeB981Ebc31,0x06A73506e9d3f6203B6064bc08c27b37c45f2a8E,0x82450858794895dAac528c3031aa09F4348302F3,0x1162F9FCF3FE109B7B0d0CcB80053eDe60B87264,0xD684c78B000C036E9ceFD493FCe68a16aED7cAC3,0xE01b335ba44a028D73Ba1B7f957eB6B25bE539A4,0x8703a2A49f7Bb2c1015D99f46d7c14d4bE2b9edD,"

sleep 5
cat $DATA_DIR/geth/static-nodes.json

geth --datadir $DATA_DIR \
     --syncmode 'full' \
     --miner.etherbase "$ETHER_BASE" \
     --networkid $NETWORK_ID \
     --gpo.maxprice $GAS_PRICE \
     --gpo.ignoreprice 0 \
     --http --http.addr 0.0.0.0 --http.api 'admin,debug,eth,miner,net,web3,personal,txpool' --http.corsdomain '*' --http.vhosts '*' \
     --ws --ws.addr 0.0.0.0 --ws.api 'admin,debug,eth,miner,net,web3,personal,txpool' --ws.origins '*' \
     --nodiscover \
     --nodekey /nodekey \
     --unlock $ETHER_BASE,$addresses \
     --allow-insecure-unlock \
     --password /password \
     --verbosity 3 \
     --mine