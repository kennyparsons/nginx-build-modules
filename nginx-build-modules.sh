#!/bin/bash

VERSION=1.17.10
BUILD_DIR=/root/builds/nginx


#######################
# Headers More Module #
#######################

cd ${BUILD_DIR} && \
git clone -q https://github.com/openresty/headers-more-nginx-module && \
wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz && \
tar xf nginx-${VERSION}.tar.gz && \
cd nginx-${VERSION} && \
\
./configure --add-dynamic-module=${BUILD_DIR}/headers-more-nginx-module \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--modules-path=/usr/lib/nginx/modules \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-compat \
--with-file-aio \
--with-threads \
--with-http_addition_module \
--with-http_auth_request_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_mp4_module \
--with-http_random_index_module \
--with-http_realip_module \
--with-http_secure_link_module \
--with-http_slice_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-http_v2_module \
--with-mail \
--with-mail_ssl_module \
--with-stream \
--with-stream_realip_module \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--with-cc-opt='-g -O2 -fdebug-prefix-map=/data/builder/debuild/nginx-1.17.10/debian/debuild-base/nginx-1.17.10=. -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' && \
\
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
\
./configure --add-dynamic-module=${BUILD_DIR}/ngx_brotli \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--modules-path=/usr/lib/nginx/modules \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-compat \
--with-file-aio \
--with-threads \
--with-http_addition_module \
--with-http_auth_request_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_mp4_module \
--with-http_random_index_module \
--with-http_realip_module \
--with-http_secure_link_module \
--with-http_slice_module \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_sub_module \
--with-http_v2_module \
--with-mail \
--with-mail_ssl_module \
--with-stream \
--with-stream_realip_module \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--with-cc-opt='-g -O2 -fdebug-prefix-map=/data/builder/debuild/nginx-1.17.10/debian/debuild-base/nginx-1.17.10=. -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' && \
\
make && \
cp ${BUILD_DIR}/nginx-${VERSION}/objs/ngx_http_brotli_filter_module.so /usr/lib/nginx/modules && \
rm -rf ${BUILD_DIR:?}/ngx_brotli \
       ${BUILD_DIR:?}/nginx-${VERSION} \
       ${BUILD_DIR:?}/nginx-${VERSION}.tar.gz
