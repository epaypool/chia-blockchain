FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y git lsb-release sudo

WORKDIR /chia-blockchain
COPY . .

RUN git submodule update --init mozilla-ca \
    && chmod +x install.sh \
    && /usr/bin/sh ./install.sh

RUN mkdir -p ~/.chia/mainnet/ && echo ${BRANCH} >> branch
