FROM  tomcat:9-jdk11
ADD ./target/hello-1.0.war /usr/local/tomcat/webapps

