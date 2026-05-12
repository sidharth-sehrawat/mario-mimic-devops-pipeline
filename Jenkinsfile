pipeline {
    agent any

    environment {
        IMAGE_NAME = "mario-app"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/sidharth-sehrawat/mario-mimic-devops-pipeline.git'
            }
        }

        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'kubectl version --client'
                sh 'gcloud version'
                sh 'trivy --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mario-app ./app/super-mario-mimic'
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy image mario-app'
            }
        }
    }
}
