pipeline {
    agent any

    tools {
        nodejs 'node'
    }

    stages {
        stage('Install and Build') {
            steps {
                bat 'npm install'
                bat 'npm run build'
            }
        }

        stage('Docker Build & Run') {
            steps {
                script {
                    // This uses the Path and DOCKER_HOST we just set up
                    bat 'docker stop my-react-app || exit 0'
                    bat 'docker rm my-react-app || exit 0'
                    bat 'docker build -t react-app-image .'
                    bat 'docker run -d --name my-react-app -p 3000:3000 react-app-image'
                }
            }
        }
    }
}