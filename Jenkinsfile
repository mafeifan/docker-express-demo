pipeline {
    agent { docker { image 'node:8.15.0-alpine' } }
    stages {
        stage('Build') { 
            steps {
                sh 'sudo npm install' 
            }
        }
    }
}
