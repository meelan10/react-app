pipeline {
    agent any

    tools {
        // Ensure this name matches exactly what you named it 
        // in Manage Jenkins -> Tools
        nodejs 'node'
    }

    stages {
        stage('Install') {
            steps {
                // Use 'bat' instead of 'sh' for Windows environments
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }
    }
}