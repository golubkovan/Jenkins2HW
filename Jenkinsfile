pipeline {
    agent {
        docker {
            image 'agolubkov/maven_3.6.3:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock' 
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
/**                sh 'service docker start'*/
                sh 'docker --version'
                sh 'ls -la'
                sh 'docker build --tag=tomcat_boxfuse .'
                sh '''docker tag agolubkov/tomcat_boxfuse tomcat_boxfuse && docker push agolubkov/tomcat_boxfuse'''
            }
        }
    }
}