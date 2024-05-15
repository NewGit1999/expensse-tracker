pipeline {
    agent any
    tools {
        jdk 'jdk'
        nodejs 'NodeJs'
    }
    environment {
        SCANNER_HOME = tool 'sonar-server'
        dockerImageName = 'expenses'
        dockerImage = ""

    }
    stages {
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/NewGit1999/expensse-tracker.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build dockerImageName
                }
            }
        }
        stage('Pushing Image') {
            environment {
                registryCredential = credentials('dockerhubcred')
            }
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push('latest')
                    }
                }
            }
        }



    }
    
}

