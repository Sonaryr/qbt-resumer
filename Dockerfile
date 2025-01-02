FROM alpine:3.21.0
ENV QBT_USER admin
ENV QBT_PASSWORD adminadmin
ENV QBT_URL http://localhost:8080
ENV QBT_RECHECK_SECONDS 60
ENV QBT_CLI_VERSION 1.8.24285.1
ARG TARGETPLATFORM

RUN apk add --no-cache icu-libs krb5-libs libgcc libintl libssl3 libstdc++ zlib curl gzip tar bash jq

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=x64; elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then ARCHITECTURE=arm; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=arm64; else ARCHITECTURE=x64; fi \
    && curl -sS -L -O --output-dir /tmp/ --create-dirs "https://github.com/fedarovich/qbittorrent-cli/releases/download/v1.8.24285.1/qbt-linux-alpine-${ARCHITECTURE}-${QBT_CLI_VERSION}.tar.gz" \
    && cd /tmp && mkdir qbittorrent-cli  && tar xzf "/tmp/qbt-linux-alpine-${ARCHITECTURE}-${QBT_CLI_VERSION}.tar.gz" -C qbittorrent-cli && mv qbittorrent-cli /usr/lib/

RUN chmod a+x /usr/lib/qbittorrent-cli/qbt
RUN ln -sf /usr/lib/qbittorrent-cli/qbt /usr/bin/qbt

COPY resumer.sh resumer.sh
RUN chmod a+x /resumer.sh

CMD ["sh","/resumer.sh"]