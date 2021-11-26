FROM nginx:1.21.4
ENV VERSION=1.21.4
ENV BUILD_DIR="/tmp/nginx"

RUN apt update && \
  apt install -y \
    build-essential \
    cmake \
    curl \
    dos2unix \
    gcc \
    git \
    libbrotli-dev \
    libbrotli1 \
    libpcre3 \
    libpcre3-dev \
    libssl-dev \
    openssl \
    zlib1g \
    zlib1g-dev \
    libxslt-dev

COPY build-mod.sh /

VOLUME /modules
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/build-mod.sh"]
