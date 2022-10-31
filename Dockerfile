FROM alpine:latest
RUN apk update && apk upgrade && apk add openjdk8 && apk add curl && mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.0.23/* /usr/local/tomcat/
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

