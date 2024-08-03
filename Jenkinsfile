pipeline {
    agent any
    environment{
        DOCKER_IMAGE = 'claxmih/lms'
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/'
        REGISTRY_CREDENTIALS_ID = '28716a9a-1996-49aa-9ecb-6aa380f09462'
    }
    stages {
        stage('Cloning project') {
            steps {
                echo 'Cloning project..'
                script {
                    git url: 'https://github.com/LaxmiHA/lms.git',
                    branch: 'main'
                }
                echo 'cloning completed'
            }
        }
        
        stage('Copy version from package.json') {
            steps {
                echo 'Copying version..'
                script{
                    def json = readJSON file: 'webapp/package.json'
                    def version = json.version
                    echo "Version: ${version}"
                }
            }
        }
        stage('debug'){
            steps{
                checkout scm
                sh 'ls -l Dockerfile'
            }
        }
        stage('BUILD docker image') {
            steps {
                echo 'Building an image'
                script {
                    dir('LMS/webapp'){
                        // Build the Docker image
                        sh 'docker build -t $DOCKER_IMAGE .'
                    }
                }
                    echo 'Build success'
                }
                
            }
        
        stage('Push Docker Image'){
            steps{
                echo 'Pushing image'
                
            }
        }
        stage('Clean Up Workspace') {
           steps {
                   echo 'Cleaning Work Space'

            }
        }
    }
}

