pipeline {
    agent any

    environment {
        // Fixed the path syntax and appended existing path
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
        DOCKER_HOST = 'tcp://localhost:2375'
    }

    stages {
        // Stage 1 removed because your Dockerfile handles the build internally
        
        stage('Docker Build & Run') {
            steps {
                script {
                    // Stop and remove old containers if they exist
                    bat 'docker stop my-react-app || exit 0'
                    bat 'docker rm my-react-app || exit 0'
                    
                    // Build the image using the Dockerfile logic
                    bat 'docker build -t react-app-image .'
                    
                    // Map port 3000 (Local) to 80 (Nginx inside container)
                    bat 'docker run -d --name my-react-app -p 3000:80 react-app-image'
                }
            }
        }
    }
}