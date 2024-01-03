pipeline {
    agent {any}
    stages {
        stage('Test') {
            steps {
                sh 'docker --version'
                sh 'maven --version'
            }
        }
    }
}