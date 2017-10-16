FROM maven:3-jdk-8
ENV JMX_EXPORTER_VERSION=0.11+SNAPSHOT
ENV REPO_TAG=parent-${JMX_EXPORTER_VERSION}
ENV JMX_DEV_BASE=/usr/src/app
ENV JMX_BASE=/opt/jmx_exporter
#EXPOSE ${SERVER_PORT}

# Install java
RUN apt-get update && \
    apt-get -y install \
        #libsctp1 \
        #tzdata \
        #tzdata-java \
        git 
        #\       
        #openjdk-8-jre-headless \
        #openjdk-8-jre 
# Build and install https://github.com/prometheus/jmx_exporter

    #cd /opt && \
RUN mkdir -p ${JMX_DEV_BASE}
WORKDIR ${JMX_DEV_BASE}
RUN git clone https://github.com/prometheus/jmx_exporter.git 

    #cd /opt/jmx_exporter && \
WORKDIR ${JMX_DEV_BASE}/jmx_exporter
 RUN   mvn package   
 RUN  cat /etc/environment
 RUN   echo $JAVA_HOME
 #RUN   dpkg -i ${JMX_DEV_BASE}/jmx_exporter/jmx_prometheus_httpserver/target/jmx_prometheus_httpserver_${JMX_EXPORTER_VERSION}_all.deb 
 #RUN  apt-get -f install 
# Clean up
 #RUN   rm -rf ${JMX_DEV_BASE}/jmx_exporter/ 
 #RUN   apt-get clean 
 #RUN   rm -rf /var/lib/apt/lists/*
 RUN   ls -la 
# Mount your own config here to override the default
VOLUME ${JMX_BASE}
WORKDIR ${JMX_BASE}
#ENTRYPOINT [ "/usr/bin/jmx_exporter" ]
CMD []
#CMD [ "${SERVER_PORT}", "/opt/jmx_exporter/conf/jmx_exporter.yaml" ]
