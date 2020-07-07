#!/bin/bash

docker run --rm -it debian:10-slim bash -c $'apt update &>/dev/null && apt install -y curl gpg &>/dev/null && \
echo "deb http://nginx.org/packages/mainline/debian buster nginx" > /etc/apt/sources.list.d/nginx.list && \
curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add - &>/dev/null && \
apt update &>/dev/null && apt install -y nginx &>/dev/null && \
nginx -V'
