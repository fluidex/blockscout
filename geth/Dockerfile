FROM ethereum/client-go:latest

EXPOSE 8545 8546

WORKDIR /geth

COPY entrypoint.sh /geth
COPY setup.js /geth

ENTRYPOINT ["/geth/entrypoint.sh"]