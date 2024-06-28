pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '8fb17e3f-d166-4f52-b703-eaf153bc530a', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            agent {
                label 'maven'
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh 'docker build -t springboot-app .'
            }
        }
        stage('Deploy') {
            agent {
                label 'docker'
            }
            steps {
                sh 'docker run -d -p 8082:8080 springboot-app'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
