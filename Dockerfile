FROM ubuntu:18.04

ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"

RUN apt update
RUN apt install apt-utils -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/user/boxfuse/
RUN mvn package -f /home/user/boxfuse/pom.xml
ADD apache-tomcat-9.0.40.tar.gz /home/user/
RUN tar -xf /home/user/apache-tomcat-9.0.40.tar.gz
RUN cp -R /home/user/apache-tomcat-9.0.40/* $CATALINA_HOME
RUN cp /home/user/boxfuse/target/hello-1.0.war $CATALINA_HOME/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]