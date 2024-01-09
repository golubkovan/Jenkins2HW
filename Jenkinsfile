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
        stage('docker_login'){
            steps{
                withCredentials([usernamePassword(credentialsID: 'dockerHub_agolubkov', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh"""
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
            }
        }
        stage('Make docker image') {
            steps {
/**                sh 'service docker start'*/
                sh 'docker --version'
                sh 'ls -la'
                sh 'docker build --tag=agolubkov/tomcat_boxfuse .'
                sh '''docker tag agolubkov/tomcat_boxfuse agolubkov/tomcat_boxfuse && docker push agolubkov/tomcat_boxfuse'''
            }
        }
    }
}