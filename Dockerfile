FROM alpine:latest
RUN apk update && apk upgrade && apk add openjdk11 && apk add curl && mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.1.7/* /usr/local/tomcat/

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

