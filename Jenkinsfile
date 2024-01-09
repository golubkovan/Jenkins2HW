pipeline {
    agent {
        docker {
            image 'agolubkov/tomcat1:v1'
            args '-u root'
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
    }
}