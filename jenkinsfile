pipeline {
    agent {
        docker { image 'agolubkov/buidimage:latest' }
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