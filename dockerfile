FROM  tomcat:9-jdk11
ADD ./target/hello-1.0.war /usr/local/tomcat/webapps
ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 700 /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa.pub
EXPOSE 8080