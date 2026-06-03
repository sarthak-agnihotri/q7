pipeline{
    agent any
    stages{
        stage('Checkout'){
            steps{
                git branch: 'main',
                url: 'https://github.com/sarthak-agnihotri/q7.git'
            }
        }
        stage('Install Dependencies'){
            steps{
                bat 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                bat 'docker build -t myapp:latest .'
            }
        }
        stage('Tag Image'){
            steps{
                bat 'docker tag myapp:latest myapp:v1'
            }
        }
        stage('Deploy Container'){
            steps{
                bat 'docker rm -f mycontainer || exit 0'
                bat 'docker run -d -p 8083:8080 --name mycontainer myapp:v1'
            }
        }
    }
    post{
        success{
            echo 'Application deployed successfully'
        }
        failure{
            echo 'Pipeline failed'
        }
    }
}