#!/bin/bash

CMD1="apt update && apt install -y curl gpg"
CMD2="echo 'deb http://nginx.org/packages/mainline/debian buster nginx' > /etc/apt/sources.list.d/nginx.list"
CMD3="curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add -"
CMD4="apt update && apt install nginx -y"
CMD5="nginx -V"

docker run --rm -it debian:10-slim bash -c "${CMD1} && ${CMD2} && ${CMD3} && ${CMD4} && ${CMD5}"
