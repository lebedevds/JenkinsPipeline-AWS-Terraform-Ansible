FROM tomcat:9.0.20-jre8-alpine
COPY /tmp/WAR/target/hello-1.0.war /usr/local/tomcat/webapps/