pipeline {
    agent any
    environment {
        DOCKER_HUB_USER = 'your_dockerhub_username'
        IMAGE_NAME = 'malware-detector'
        DOCKER_HUB_CREDS = credentials('docker-hub-credentials-id')
    }
    stages {
        stage('Build Image') {
            steps {
                sh "docker build -t ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh "echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin"
                sh "docker push ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest"
            }
        }
        stage('Deploy with Compose') {
            steps {
                // Ensure logs directory exists on host
                sh "mkdir -p ./network_logs"
                sh "docker-compose up -d"
            }
        }
    }
}
