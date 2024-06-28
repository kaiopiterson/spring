pipeline {
    agent any

    environment {
        // ID de credenciais do Docker Hub
        //DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: '8fb17e3f-d166-4f52-b703-eaf153bc530a', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            steps {
                script {
                    // Construir projeto Spring Boot
                    dir('path-to-springboot-project') {
                        sh 'mvn clean package'
                    }
                }
            }
        }
        stage('Build Docker Images') {
            steps {
                script {
                    // Construir imagem Docker para o projeto Spring Boot
                    dir('path-to-springboot-project') {
                        sh 'docker build -t springboot-app .'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Executar contêiner Docker para o projeto Spring Boot
                    sh 'docker run -d -p 8082:8080 springboot-app'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
