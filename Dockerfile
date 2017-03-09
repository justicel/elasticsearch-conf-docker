FROM rancher/confd-base:latest

ADD ./run.sh /
ADD ./dockerentry.sh /

VOLUME /usr/share/elasticsearch/config
VOLUME /data/confd
VOLUME /opt/rancher/bin

ENTRYPOINT ["/dockerentry.sh"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25"]
