pipeline {
    agent any

    environment {
        // FORCE the path here. Change the part after C: if your path is different
        PATH = "C:\Program Files\Docker\Docker\resources\bin\docker.exe;${env.PATH}"
        DOCKER_HOST = 'tcp://localhost:2375'
    }

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
                    // We use "bat" to run Windows commands
                    bat 'docker stop my-react-app || exit 0'
                    bat 'docker rm my-react-app || exit 0'
                    bat 'docker build -t react-app-image .'
                    bat 'docker run -d --name my-react-app -p 3000:3000 react-app-image'
                }
            }
        }
    }
}