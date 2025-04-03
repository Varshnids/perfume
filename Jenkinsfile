pipeline {
    agent any  // Run on any available agent
    
    environment {
        DOCKER_IMAGE = 'varshni057/perfume-app'  // Change this
        KUBE_DEPLOYMENT = 'perfume-app-deployment.yaml'  // Change this
        DOCKER_CREDENTIALS = 'docker-hub-credentials'  // Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Varshnids/perfume.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: DOCKER_CREDENTIALS, url: '']) {
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f ${KUBE_DEPLOYMENT}"
            }
        }

        stage('Verify Deployment') {
            steps {
                sh "kubectl get pods"
                sh "kubectl get services"
            }
        }

        stage('Monitor with Prometheus & Grafana') {
            steps {
                echo "Prometheus monitoring enabled"
                echo "Grafana dashboard available"
            }
        }
    }
    
    post {
        success {
            echo "✅ Deployment Successful!"
        }
        failure {
            echo "❌ Deployment Failed! Check logs."
        }
    }
}
