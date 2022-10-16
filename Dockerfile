#install tomcat
FROM ubuntu

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN  wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68-fulldocs.tar.gz.asc
RUN tar xvfz apache*.tar.gz.asc
RUN mv apache-tomcat-9.0.68/* /opt/tomcat/.

WORKDIR /opt/tomcat/webapps


EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


FROM openjdk:latest
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]



