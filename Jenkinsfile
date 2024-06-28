pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '6c8c3fdd-c673-4f00-a8b5-8285149e2031', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            steps {
                script {
                    {
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
        /*stage('Deploy') {
            steps {
                script {
                    // Executar contêiner Docker para o projeto Spring Boot
                    sh 'docker run -d -p 8082:8080 springboot-app'
                }
            }
        }*/
    }

    post {
        always {
            cleanWs()
        }
    }
}
