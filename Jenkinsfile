pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = "dockerhub"
        DOCKER_IMAGE_NAME = "bnsdcr/java_app"
    }
   
    stages {
        stage("Checkout the code from Git") {
            steps {
                git credentialsId: 'github', url: 'https://github.com/sabah150170/devops_java.git', branch: 'main'
            }
        }
        
        stage('Build the Docker images') {
            steps {
                script {
			docker.build("${DOCKER_IMAGE_NAME}")
                }
            }
        }
        
        stage('Login and Push the Docker images') {
            steps {
                script {
                    docker.withRegistry( '', DOCKER_HUB_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}").push()
                    }
                }
            }
        }
    }
}
