pipeline {
    agent any

    environment {
        IMAGE_NAME = "mario-app"
    }

    stages {

        stage('Verify Tools') {
            steps {
                sh 'docker --version'
                sh 'kubectl version --client'
                sh 'gcloud version'
                sh 'trivy --version'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh '''
                    sonar-scanner \
                    -Dsonar.projectKey=mario-app \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://35.222.190.143:9000 \
                    -Dsonar.login=squ_5aae2bb96a2b115eb9137ac7737fa54131ecbbe4
                    '''
                }
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
