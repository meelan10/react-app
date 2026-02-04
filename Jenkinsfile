pipeline {
    agent any

    tools {
        nodejs 'node'
    }

    stages {
        stage('Install') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Docker Build & Run') {
            steps {
                script {
                    // 1. Stop and remove the old container if it exists (ignores error if it doesn't)
                    bat 'docker stop my-react-app || true'
                    bat 'docker rm my-react-app || true'
                    
                    // 2. Build the image
                    bat 'docker build -t react-app-image .'
                    
                    // 3. Run the container on port 3000
                    bat 'docker run -d --name my-react-app -p 3000:3000 react-app-image'
                }
            }
        }
    }
}