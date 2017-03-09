FROM rancher/confd-base:latest

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./run.sh /opt/rancher/bin/

VOLUME /usr/share/elasticsearch/config
VOLUME /data/confd
VOLUME /opt/rancher/bin

RUN addgroup -g 1000 -S elasticsearch \ 
  && adduser -S -G elasticsearch -D -H -h / -u 1000 elasticsearch elasticsearch \
  && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config /data/confd

USER elasticsearch

ENTRYPOINT ["/usr/bin/confd"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
