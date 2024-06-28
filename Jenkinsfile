pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'maven:3.8.1-openjdk-11'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '8fb17e3f-d166-4f52-b703-eaf153bc530a', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            steps {
                script {
                    // Usando Docker para construir o projeto Spring Boot
                    docker.image(env.DOCKER_IMAGE).inside {
                        sh 'mvn clean package'
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Construir imagem Docker para o projeto Spring Boot
                    sh 'docker build -t springboot-app .'
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
