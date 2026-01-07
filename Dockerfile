# Dockerfile for xray based alpine
# Reference URL:
# https://github.com/XTLS/Xray-core
# https://github.com/v2fly/v2ray-core
# https://github.com/Loyalsoldier/v2ray-rules-dat

FROM alpine:latest

ARG VERSION=v25.12.8
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

VOLUME /etc/xray
VOLUME /var/log/xray

ENV TZ=Asia/Shanghai

CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]