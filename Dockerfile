FROM davidkarlsen/docker-java:8u161
ARG MARID_VERSION=2.13.0
RUN wget https://s3-us-west-2.amazonaws.com/opsgeniedownloads/repo/opsgenie-marid_${MARID_VERSION}_all.deb -O /tmp/marid.dpkg && \
	dpkg -i /tmp/marid.dpkg && \
	rm /tmp/marid.dpkg && \
	mkdir -p /var/log/opsgenie/marid && \
	chown -R opsgenie:opsgenie /var/log/opsgenie && \
	apt update && apt -y install net-tools netcat vim && apt -y clean
COPY run.sh /
CMD /run.sh
