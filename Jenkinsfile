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
                sh 'docker build --tag=agolubkov/tomcat_boxfuse .'
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

        stage('SSH') {
        steps {
        script {                 
            def remote = [:]
            remote.name = 'prod'
            remote.host = '10.128.0.5'
            remote.allowAnyHosts = true
                withCredentials([usernamePassword(credentialsId: 'prod_root', passwordVariable: 'password', usernameVariable: 'username')]) {
                    remote.user = "${username}"
                    remote.password = "${password}"
                }
            sshCommand remote: remote, command: "sudo pwd"
            }
        }
        }
        
      
    }
}