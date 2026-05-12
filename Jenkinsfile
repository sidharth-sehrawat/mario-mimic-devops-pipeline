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
            sh """
            ${tool 'sonar-scanner'}/bin/sonar-scanner \
            -Dsonar.projectKey=mario-app \
            -Dsonar.sources=. \
            -Dsonar.host.url=http://35.222.190.143:9000 \
            -Dsonar.login=squ_e7b938397c477582982f049120acf2e9001eb02c
            """
        }
    }
}

      stage('Build Docker Image') {
          steps {
            sh '''
                docker build -t asia-south1-docker.pkg.dev/jenkins-mario-devops-pipeline/mario-repo/mario-app:v1 ./app/super-mario-mimic
                '''
          } 
        }

        stage('Push Docker Image') {
           steps {
              sh '''
                    docker push asia-south1-docker.pkg.dev/jenkins-mario-devops-pipeline/mario-repo/mario-app:v1
                  '''
            }
        }
        stage('Trivy Scan') {
            steps {
                sh 'trivy image mario-app'
            }
        }
        stage('Deploy to GKE') {
    steps {
        sh '''
        gcloud container clusters get-credentials mario-gke-cluster \
        --zone asia-south1-a \
        --project jenkins-mario-devops-pipeline

        kubectl apply -f k8s/deployment.yaml
        kubectl apply -f k8s/service.yaml
        '''
            }
        }
    }
}
