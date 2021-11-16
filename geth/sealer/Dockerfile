FROM ethereum/client-go:latest

ENV DATA_DIR /geth
ENV NETWORK_ID 53371
ENV GAS_PRICE 1

COPY genesis.json /
COPY keystore $DATA_DIR/keystore
COPY password /
RUN geth --datadir $DATA_DIR init /genesis.json
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
