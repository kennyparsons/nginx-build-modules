#!/bin/bash

VERSION="1.19.2"
BUILD_DIR="/tmp/nginx"

get_nginx_args() {
  docker pull debian:10-slim &>/dev/null && \
  docker run --rm -it debian:10-slim bash -c $'apt update &>/dev/null && apt install -y curl gpg &>/dev/null && \
    echo "deb http://nginx.org/packages/mainline/debian buster nginx" > /etc/apt/sources.list.d/nginx.list && \
    curl -sSL https://nginx.org/keys/nginx_signing.key | apt-key --keyring /etc/apt/trusted.gpg.d/nginx.gpg add - &>/dev/null && \
    apt update &>/dev/null && apt install -y nginx=1.19.2\* &>/dev/null && \
    nginx -V 2>&1'
}

apt update &>/dev/null && \
apt install -y cmake curl dos2unix gcc git libbrotli-dev libbrotli1 libpcre3 libpcre3-dev libssl-dev openssl zlib1g zlib1g-dev &>/dev/null

BUILD_ARGS="$(get_nginx_args | sed '1,4d;s|configure arguments:[[:blank:]]||g' | dos2unix)"

mkdir "${BUILD_DIR:?}" && \
cd "${BUILD_DIR:?}" && \
git clone -q https://github.com/openresty/headers-more-nginx-module && \
git clone -q https://github.com/google/ngx_brotli && \
curl -sSL http://nginx.org/download/nginx-"${VERSION}".tar.gz | tar -xzf- && \
cd nginx-"${VERSION}" && \
echo -e "${BUILD_ARGS:?}" | xargs ./configure \
--add-dynamic-module="${BUILD_DIR}"/headers-more-nginx-module \
--add-dynamic-module="${BUILD_DIR}"/ngx_brotli && \
make && \
cp "${BUILD_DIR:?}"/nginx-"${VERSION}"/objs/ngx_http_headers_more_filter_module.so /usr/lib/nginx/modules && \
cp "${BUILD_DIR:?}"/nginx-"${VERSION}"/objs/ngx_http_brotli_filter_module.so /usr/lib/nginx/modules && \
cp "${BUILD_DIR:?}"/nginx-"${VERSION}"/objs/ngx_http_brotli_static_module.so /usr/lib/nginx/modules && \
rm -rv "${BUILD_DIR:?}"