pipeline {
    agent {
        docker {
            image 'node:8.15.0-alpine'
        }
    }
    // 避免 npm install 报权限问题
    environment {
        HOME = '.'
        email_to='mafeifan@qq.com'
    }
    stages {
        stage('Master') {
            when {
                branch 'master'
            }
            steps {
                sh 'npm install'
                sh 'node -v'
            }
        }
        stage('Staging') {
            when {
                branch 'staging'
            }
            steps {
                echo 'This is staging branch'
            }
        }
        stage('Develop') {
            when {
                branch 'develop'
            }
            steps {
                echo 'This is develop branch'
            }
        }
    }

    post {
        always {
            configFileProvider([configFile(fileId: 'email-groovy-template-cn', targetLocation: 'email.html', variable: 'content')]) {
               script {
                   template = readFile encoding: 'UTF-8', file: "${content}"
                   emailext(
                       to: "${email_to}",
                       subject: "Job [${env.JOB_NAME}] - Status: ${currentBuild.result?: 'success'}",
                       body: """${template}"""
                   )
               }
            }
        }
    }
}
