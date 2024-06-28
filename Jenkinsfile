pipeline {
    agent {
        docker {
            image 'maven:3.8.6-openjdk-11'
            args '-v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=tcp://jenkins-dind:2375'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '8fb17e3f-d166-4f52-b703-eaf153bc530a', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t springboot-app .'
            }
        }
        stage('Deploy') {
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
