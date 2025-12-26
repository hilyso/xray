FROM alpine:latest

ARG VERSION=v24.12.18
ARG FILENAME=Xray-linux-64.zip

RUN set -ex \
    apk add --no-cache bash tzdata ca-certificates openssl curl unzip
    && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/${VERSION}/${FILENAME} \
    && unzip /tmp/${FILENAME} \
    && mv /tmp/xray /usr/bin/xray
    && rm -rf /tmp/*

COPY server.json /etc/xray/config.json

VOLUME /etc/xray
VOLUME /var/log/xray

ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/xray", "-config", "/etc/xray/config.json" ]