pipeline {
    agent {
        docker { 
            image 'agolubkov/buidimage'
             }
    }
    stages {
        stage('Test') {
            steps {
                sh 'docker --version'
                sh 'maven --version'
            }
        }
    }
}