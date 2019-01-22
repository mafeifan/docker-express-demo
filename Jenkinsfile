pipeline {
    agent { docker { image 'node:8.15.0-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'npm --version'
            }
        }
    }
}
