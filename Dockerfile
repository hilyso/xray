FROM alpine:latest

WORKDIR /root
COPY server.json /etc/xray/config.json
COPY xray /usr/bin/xray
RUN apk add --no-cache bash tzdata ca-certificates openssl 
VOLUME /etc/xray
VOLUME /var/log/xray

ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/xray", "-config", "/etc/xray/config.json" ]