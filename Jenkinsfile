pipeline {
    agent {
        docker {
            image 'agolubkov/maven_3.6.3:latest'
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