pipeline {
    agent {
        docker {
            image 'agolubkov/maven_3.6.3:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock --privileged --user="root"' 
        }
   } 

    
    stages {
        stage('Copy source with configs') {
            steps {
                git'https://github.com/golubkovan/Jenkins2HW.git'
            }
        }
        stage('Build jar') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Make docker image') {
            steps {
                sh 'ls -la'
                sh 'DOCKER_BUILDKIT=1 docker build --tag=agolubkov/tomcat_boxfuse .'
            }
        }
        stage('Push image') {
            steps{
                withCredentials([usernamePassword( credentialsId: 'dockerHub', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u $USER -p $PASSWORD'
                    sh 'docker push agolubkov/tomcat_boxfuse'
                }
            }
        }
        stage('Run docker on slave1') {
            steps {
                    sh 'ssh  -o "StrictHostKeyChecking no" 10.128.0.5 docker stop -f tomcat_boxfuse && docker rm -f tomcat_boxfuse && docker rmi -f agolubkov/tomcat_boxfuse:latest && docker run --name tomcat_boxfuse -d -p 8080:8080 agolubkov/tomcat_boxfuse'
            }
        }
    
    }
}
