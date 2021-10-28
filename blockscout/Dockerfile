FROM elixir:latest

COPY blockscout /usr/src/blockscout
WORKDIR /usr/src/blockscout

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

ENV NODE_VERSION=v14.17.4
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
ENV PATH="/root/.nvm/versions/node/${NODE_VERSION}/bin/:${PATH}"

RUN mix do local.hex --force, deps.get, local.rebar --force, deps.compile, compile
RUN cd apps/block_scout_web/assets && \
    npm ci && node_modules/webpack/bin/webpack.js --mode production && \
    cd -
RUN cd apps/explorer && npm ci && cd /usr/src/blockscout
RUN mix phx.digest

COPY entrypoint.sh /
COPY run-once.sh /usr/src/blockscout

ENTRYPOINT ["/entrypoint.sh"]