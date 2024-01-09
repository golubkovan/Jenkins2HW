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
                    def registry_url = "registry.hub.docker.com/"
                    bat "docker login -u $USER -p $PASSWORD ${registry_url}"
/**                    docker.withRegistry("http://${registry_url}", "dockerHub") {
                        // Push your image now
                        bat "docker push agolubkov/tomcat_boxfuse"
                    }*/
                }
            }
        }
      
    }
}