pipeline {
    agent any

    environment {
        VENV = "venv"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/your-username/python-jenkins-cicd.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                bat '''
                python -m venv venv
                call venv\\Scripts\\activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                bat '''
                call venv\\Scripts\\activate
                pytest tests
                '''
            }
        }

        stage('Run Application') {
            steps {
                bat '''
                call venv\\Scripts\\activate
                python main.py
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