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
        //定义构建的步骤
        stage('Build') {
            //步骤1，名称为Build，自定义即可
            steps {
                //Build步骤里的具体动作
                sh 'npm install'
                sh 'node -v'
            }
        }
        stage('Test') {
            steps {
                echo 'This is a test step'
            }
        }
        stage('Deploy') {
            steps {
                echo 'This is a deploy step'
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
