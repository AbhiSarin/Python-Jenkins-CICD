pipeline {
    agent any

    environment {
        VENV = "venv"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/AbhiSarin/Python-Jenkins-CICD.git'
            }
        }


        stage('Setup Python Environment') {
            steps {
                bat '''
                python -m venv venv
                venv\\Scripts\\python.exe -m pip install --upgrade pip
                venv\\Scripts\\python.exe -m pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                bat '''
                venv\\Scripts\\python.exe -m pytest tests
                '''
            }
        }

        stage('Run Application') {
            steps {
                bat '''
                venv\\Scripts\\python.exe main.py
                '''
            }
        }

        stage('Deploy') {
            steps {
                bat '''
                call deployment\\deploy.bat
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
```
