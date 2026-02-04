stage('Docker Build & Run') {
    environment {
        // This helps the docker CLI find the engine on some Windows setups
        DOCKER_HOST = 'npipe:////./pipe/docker_engine'
    }
    steps {
        script {
            // Use 'exit 0' for Windows Batch
            bat 'docker stop my-react-app || exit 0'
            bat 'docker rm my-react-app || exit 0'
            
            // Build the image
            bat 'docker build -t react-app-image .'
            
            // Run the container
            bat 'docker run -d --name my-react-app -p 3000:3000 react-app-image'
        }
    }
}