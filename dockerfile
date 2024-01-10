FROM  tomcat:9-jdk11
ADD ./target/hello-1.0.war /usr/local/tomcat/webapps
ADD --chown=root:root --chmod=700 ./id_rsa ~/.ssh/id_rsa
ADD --chown=root:root --chmod=644 ./id_rsa.pub ~/.ssh/id_rsa.pub
EXPOSE 8080
