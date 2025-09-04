pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = "docker-compose.yml"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "📥 Cloning repo..."
                git branch: 'main', url: 'https://github.com/maheshpalakonda/lic_portal.git'
            }
        }

        stage('Build & Run Containers') {
            steps {
                echo "🐳 Building and starting containers..."
                sh '''
                    docker-compose down || true
                    docker-compose up -d --build
                '''
            }
        }

        stage('Wait for Database') {
            steps {
                script {
                    echo "⏳ Waiting for MySQL to become healthy..."
                    sh '''
                        for i in {1..20}; do
                          status=$(docker inspect --format='{{.State.Health.Status}}' lic_mysql || echo "unhealthy")
                          if [ "$status" = "healthy" ]; then
                            echo "✅ MySQL is healthy"
                            exit 0
                          fi
                          echo "Still waiting... ($i/20)"
                          sleep 5
                        done
                        echo "❌ MySQL did not become healthy in time"
                        exit 1
                    '''
                }
            }
        }

        stage('Verify Web App') {
            steps {
                script {
                    echo "🌐 Checking if web app is running..."
                    sh '''
                        for i in {1..10}; do
                          if curl -fs http://localhost:3000 > /dev/null; then
                            echo "✅ Web app is up and running!"
                            exit 0
                          fi
                          echo "App not ready yet... retrying ($i/10)"
                          sleep 5
                        done
                        echo "❌ Web app did not respond in time"
                        exit 1
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Deployment successful! App available at http://<EC2-IP>:3000"
        }
        failure {
            echo "❌ Deployment failed. Check logs above."
        }
    }
}

