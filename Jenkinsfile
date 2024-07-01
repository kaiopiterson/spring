pipeline {
    agent any

    environment {
        KUBECONFIG_CREDENTIALS_ID = 'kubeconfig' // substitua pelo ID da credencial do arquivo kubeconfig
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/kaiopiterson/spring'
            }
        }
        stage('Build Spring Boot') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            agent {
                label 'docker'
            }
            steps {
                sh 'docker build -t spring .'
            }
        }
        /*stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u your_dockerhub_username -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag springboot-app your_dockerhub_username/springboot-app:latest'
                    sh 'docker push your_dockerhub_username/springboot-app:latest'
                }
            }
        }*/
        stage('Deploy to Kubernetes') {
            agent {
                label 'docker'
            }
            steps {
                withCredentials([file(credentialsId: env.KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig=$KUBECONFIG'
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
