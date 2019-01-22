pipeline {
  agent {
    docker {
      image 'node:8.15.0-alpine'
    }

  }
  stages {
    stage('Build') {
      agent {
        dockerfile {
          filename 'Dockerfile'
        }

      }
      steps {
        sh 'npm install'
      }
    }
  }
  environment {
    HOME = '.'
  }
}