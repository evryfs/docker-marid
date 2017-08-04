FROM davidkarlsen/docker-java:8u144
RUN wget https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-marid_2.8.0_all.deb -O /tmp/marid.dpkg && dpkg -i /tmp/marid.dpkg && mkdir -p /var/log/opsgenie/marid && chown -R opsgenie:opsgenie /var/log/opsgenie
COPY run.sh /
CMD /run.sh
