#!/bin/bash

VERSION=1.19.1
BUILD_DIR=/root/builds/nginx
BUILD_ARGS=$(<nginx-build-args)

#######################
# Headers More Module #
#######################

cd ${BUILD_DIR} && \
git clone -q https://github.com/openresty/headers-more-nginx-module && \
wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz && \
tar xf nginx-${VERSION}.tar.gz && \
cd nginx-${VERSION} && \
./configure ${BUILD_ARGS} && \
make && \
cp ${BUILD_DIR}/nginx-${VERSION}/objs/ngx_http_headers_more_filter_module.so /usr/lib/nginx/modules && \
rm -rf ${BUILD_DIR:?}/headers-more-nginx-module \
       ${BUILD_DIR:?}/nginx-${VERSION} \
       ${BUILD_DIR:?}/nginx-${VERSION}.tar.gz

#################
# Brotli Module #
#################

cd ${BUILD_DIR} && \
git clone -q https://github.com/google/ngx_brotli && \
wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz && \
tar xf nginx-${VERSION}.tar.gz && \
cd nginx-${VERSION} && \
./configure ${BUILD_ARGS} && \
make && \
cp ${BUILD_DIR}/nginx-${VERSION}/objs/ngx_http_brotli_filter_module.so /usr/lib/nginx/modules && \
rm -rf ${BUILD_DIR:?}/ngx_brotli \
       ${BUILD_DIR:?}/nginx-${VERSION} \
       ${BUILD_DIR:?}/nginx-${VERSION}.tar.gz
