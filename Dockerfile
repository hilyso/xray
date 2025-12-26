FROM alpine:latest

ARG VERSION=v24.12.18
ARG FILENAME=Xray-linux-64.zip

RUN set -eux; \
    apk add --no-cache \
        bash \
        tzdata \
        ca-certificates \
        openssl \
        curl \
        unzip; \
    curl -fL -o /tmp/${FILENAME} \
        https://github.com/XTLS/Xray-core/releases/download/${VERSION}/${FILENAME}; \
    unzip /tmp/${FILENAME} -d /tmp; \
    install -m 755 /tmp/xray /usr/bin/xray; \
    rm -rf /tmp/*

VOLUME ["/etc/xray", "/var/log/xray"]

ENV TZ=Asia/Shanghai

CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
