pipeline {
    agent { 
      docker { 
        image 'node:8.15.0-alpine' 
      } 
    }
    environment {
        HOME = '.'
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}
