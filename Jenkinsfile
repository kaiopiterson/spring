pipeline {
    agent any

    stages {
        stage('Build') {
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
