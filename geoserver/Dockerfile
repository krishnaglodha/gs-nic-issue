# package deployment
FROM geobeyond/georoma-geoserver:2.20.0.patched

USER root

ENV http_proxy=http://10.173.21.20:3128
ENV https_proxy=http://10.173.21.20:3128
#
#RUN echo "http.proxyHost=10.173.21.20" >> /usr/local/tomcat/conf/catalina.properties && \
#	echo "https.proxyHost=10.173.21.20" >> /usr/local/tomcat/conf/catalina.properties && \
#	echo "http.proxyPort=3128" >> /usr/local/tomcat/conf/catalina.properties && \
#	echo "https.proxyPort=3128" >> /usr/local/tomcat/conf/catalina.properties && \
#	echo "http.nonProxyHosts=collaudosit.comune.roma"  >> /usr/local/tomcat/conf/catalina.properties

RUN mkdir -p /opt/geoserver/data_dir_shared

WORKDIR /geoserver

# Dependency jars for Geofence to work with postgis
COPY hibernate-spatial-postgis-1.1.3.2.jar /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/hibernate-spatial-postgis-1.1.3.2.jar
COPY postgis-jdbc-1.3.3.jar /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/postgis-jdbc-1.3.3.jar

COPY global_georoma.xml /opt/geoserver/data_dir/global.xml
COPY logging_georoma.xml /opt/geoserver/data_dir/logging.xml
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY wait-for-it.sh .
RUN chmod +x *.sh

# Copia certificato SSOPRE
# COPY ssopre.pem /usr/local/tomcat/conf/ssopre.pem
# RUN keytool -importcert -noprompt -file /usr/local/tomcat/conf/ssopre.pem -storepass changeit -keystore
# /usr/local/openjdk-11/lib/security/cacerts -alias ssopre

EXPOSE 8080