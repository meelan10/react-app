pipeline {
    agent any

    tools {
        nodejs 'node' 
    }

    stages {
        stage('Install and Build') {
            steps {
                // Using bat for Windows
                bat 'npm install'
                bat 'npm run build'
            }
        }

        stage('Docker Build & Run') {
            steps {
                script {
                    // 1. Stop and remove old container if it exists
                    // || exit 0 prevents the build from failing if the container isn't there
                    bat 'docker stop my-react-app || exit 0'
                    bat 'docker rm my-react-app || exit 0'
                    
                    // 2. Build the image
                    bat 'docker build -t react-app-image .'
                    
                    // 3. Run the container
                    bat 'docker run -d --name my-react-app -p 3000:3000 react-app-image'
                }
            }
        }
    }
}