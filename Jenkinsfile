pipeline {
    agent {
        // 在Docker容器里跑Job，跑完Jenkins会自动删除容器
        docker {
            image 'node:8.15.0-alpine'
        }
    }
    // 避免 npm install 报权限问题
    environment {
        HOME = '.'
        _EMAIL_TO='mafeifan@qq.com'
    }
    options {
        // 不允许同时执行流水线, 防止同时访问共享资源等
        disableConcurrentBuilds()
        // 显示具体的构建流程时间戳
        timestamps()
    }
    stages {
        // 只有修改 JS 或 CSS 资源文件才触发 Build 步骤
        stage('Build') {
            when {
                anyOf {
                    changeset "**/*.js"
                    changeset "**/*.css"
                }
            }
            steps {
                sh 'npm install'
                sh 'node -v'
            }
        }
        // 只有触发 Master 分支才发邮件
        stage('Master') {
            when {
                beforeAgent true
                branch 'master'
            }
            steps {
                echo 'master branch'
            }
            post {
                always {
                    configFileProvider([configFile(fileId: 'email-groovy-template-cn', targetLocation: 'email.html', variable: 'content')]) {
                       script {
                           template = readFile encoding: 'UTF-8', file: "${content}"
                           emailext(
                               to: "${env._EMAIL_TO}",
                               subject: "Job [${env.JOB_NAME}] - Status: ${currentBuild.result?: 'success'}",
                               body: """${template}"""
                           )
                       }
                    }
                }
            }
        }
        stage('Staging') {
            when {
                beforeAgent true
                branch 'staging'
            }
            steps {
                echo 'This is staging branch'
            }
        }
        stage('Develop') {
            when {
                beforeAgent true
                branch 'develop'
            }
            steps {
                echo 'This is develop branch'
            }
        }
    }
}
