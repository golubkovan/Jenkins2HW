pipeline {
    agent {
        label  'agolubkov/buidimage'
             
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