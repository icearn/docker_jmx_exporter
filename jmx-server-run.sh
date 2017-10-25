#!/bin/sh
java $HEAP_OPTS -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=$REMOTE_PORT -jar jmx_prometheus_httpserver.jar $SERVER_PORT /opt/jmx_exporter/conf/jmx-exporter.yaml
