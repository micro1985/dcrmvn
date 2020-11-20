FROM ubuntu:18.04
RUN apt update
RUN apt install apt-utils -y
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
EXPOSE 8080
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home/user/boxfuse/
RUN sudo mvn /home/user/boxfuse
RUN cp /home/user/boxfuse/hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]