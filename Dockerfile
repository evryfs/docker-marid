FROM quay.io/evryfs/base-java:java8-20210427
ARG MARID_VERSION=2.15.0
RUN wget https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-marid_${MARID_VERSION}_all.deb -O /tmp/marid.dpkg && \
	dpkg -i /tmp/marid.dpkg && \
	rm /tmp/marid.dpkg && \
	mkdir -p /var/log/opsgenie/marid && \
	chown -R opsgenie:opsgenie /var/log/opsgenie && \
	apt-get update && apt-get -y --no-install-recommends install net-tools netcat vim && apt-get -y clean && \
	rm -rf /var/cache/apt /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY run.sh /
COPY log4j.properties /etc/opsgenie/marid/log.properties
USER opsgenie
CMD ["/run.sh"]
