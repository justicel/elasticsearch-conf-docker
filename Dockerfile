FROM rancher/confd-base:latest

ADD ./run.sh /
ADD ./dockerentry.sh /

VOLUME /usr/share/elasticsearch/config
VOLUME /data/confd
VOLUME /opt/rancher/bin

RUN curl -L -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 \
  && chmod +x /usr/bin/confd

ENTRYPOINT ["/dockerentry.sh"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
