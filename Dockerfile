FROM evryfs/docker-java:java8
ARG MARID_VERSION=2.15.0
RUN wget https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-marid_${MARID_VERSION}_all.deb -O /tmp/marid.dpkg && \
	dpkg -i /tmp/marid.dpkg && \
	rm /tmp/marid.dpkg && \
	mkdir -p /var/log/opsgenie/marid && \
	chown -R opsgenie:opsgenie /var/log/opsgenie && \
	apt update && apt -y install net-tools netcat vim && apt -y clean
COPY run.sh /
COPY log4j.properties /etc/opsgenie/marid/log.properties
RUN ln -s /scripts/gitsync /var/opsgenie/marid/scripts
CMD /run.sh
