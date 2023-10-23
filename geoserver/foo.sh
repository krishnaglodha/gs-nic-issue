#!/usr/bin/env bash

echo "Krishna was here"
wget http://www.java2s.com/Code/JarDownload/json-simple/json-simple-1.1.1.jar.zip

unzip json-simple-1.1.1.jar.zip  

mv json-simple-1.1.1.jar /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/