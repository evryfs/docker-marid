#!/bin/bash

. /lib/lsb/init-functions
. /etc/opsgenie/profile

prog="marid"
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${MARID_JVM} -cp ${MARID_CLASSPATH} com.ifountain.opsgenie.client.marid.Bootstrap"
marid="$DAEMON $DAEMON_ARGS"
PID_FILE=/var/run/${prog}.pid
servicelog=/var/log/opsgenie/marid/service.log

echo -n $"Starting $prog: "
su -s /bin/bash opsgenie -c "$marid"  >> $servicelog

