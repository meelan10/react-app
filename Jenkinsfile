pipeline {
    agent any

    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;${env.PATH}"
        // ADD THIS: Clear any global DOCKER_HOST settings
        DOCKER_HOST = "" 
        
        IMAGE_NAME = "react-app-image"
        CONTAINER_NAME = "my-react-app"
    }

    stages {
        stage('Docker Build & Run') {
            steps {
                script {
                    // Use the variables defined above
                    bat "docker stop ${CONTAINER_NAME} || exit 0"
                    bat "docker rm ${CONTAINER_NAME} || exit 0"
                    
                    bat "docker build -t ${IMAGE_NAME} ."
                    
                    // Mapping Local 3000 to Container 80 (Nginx)
                    bat "docker run -d --name ${CONTAINER_NAME} -p 3000:80 ${IMAGE_NAME}"
                }
            }
        }
    }
}