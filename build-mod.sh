#!/bin/bash

VERSION_S=$VERSION
BUILD_DIR_S="/tmp/nginx"
BUILD_ARGS=$(nginx -V 2>&1 | sed '1,4d;s|configure arguments:[[:blank:]]||g' | dos2unix)
echo $BUILD_ARGS

mkdir "${BUILD_DIR_S:?}" &&
  cd "${BUILD_DIR_S:?}" &&
  git clone -q https://github.com/openresty/headers-more-nginx-module &&
  git clone -q https://github.com/google/ngx_brotli &&
  curl -sSL http://nginx.org/download/nginx-"${VERSION_S:?}".tar.gz | tar -xzf- &&
  cd nginx-"${VERSION_S:?}" &&
  echo -e "${BUILD_ARGS:?}" | xargs ./configure \
    --add-dynamic-module="${BUILD_DIR_S:?}"/headers-more-nginx-module \
    --add-dynamic-module="${BUILD_DIR_S:?}"/ngx_brotli \
    --with-http_xslt_module=dynamic &&
  make &&
  # cp "${BUILD_DIR_S:?}"/nginx-"${VERSION_S:?}"/objs/ngx_http_headers_more_filter_module.so /modules &&
  # cp "${BUILD_DIR_S:?}"/nginx-"${VERSION_S:?}"/objs/ngx_http_brotli_filter_module.so /modules &&
  # cp "${BUILD_DIR_S:?}"/nginx-"${VERSION_S:?}"/objs/ngx_http_brotli_static_module.so /modules &&
  cp "${BUILD_DIR_S:?}"/nginx-"${VERSION_S:?}"/objs/*.so /modules