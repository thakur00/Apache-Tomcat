FROM alpine:latest
RUN apk update && apk upgrade && apk add openjdk8 && apk add curl && mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

