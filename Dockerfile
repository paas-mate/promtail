FROM ttbb/base

WORKDIR /opt/sh/promtail

ARG TARGETARCH

RUN wget https://github.com/grafana/loki/releases/download/v2.6.1/promtail-linux-$TARGETARCH.zip  && \
    unzip promtail-linux-$TARGETARCH.zip && \
    mv promtail-linux-$TARGETARCH promtail && \
    rm -rf promtail-linux-$TARGETARCH.zip

ENV PROMTAIL_HOME=/opt/sh/promtail

ENTRYPOINT ["/opt/sh/promtail/promtail"]
CMD ["-config.expand-env","-config.file=/opt/sh/promtail/config/config.yml"]
