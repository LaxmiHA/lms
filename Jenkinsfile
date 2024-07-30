pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/claxmih/lms/general'
        DOCKER_CRED = '28716a9a-1996-49aa-9ecb-6aa380f09462'
        IMAGE_NAME = 'claxmih/lms'
   }

    stages {
        stage('Cloning project') {
            steps {
                echo 'Cloning project..'
                git 'https://github.com/LaxmiHA/lms.git'
            }
        }
        stage('Copy version from package.json') {
            steps {
                echo 'Copying version..'
                script{
                    def packageJson = readJSON file: 'package.json'
                    env.VERSION = packageJson.version
                }
            }
        }
        stage('BUILD docker image') {
            steps {
                echo 'Building an image'
                script{
                    docker.build("${env.IMAGE_NAME}:${env.VERSION}")
                }
            }
        }
        stage('Push Docker Image'){
            steps{
                echo 'Pushing image'
                script{
                    docker.withRegistry("${env.DOCKER_REGISTRY}","${env.DOCKER_CRED}")
                    {
                        docker.image("${env.IMAGE_NAME}:${env.VERSION}").push()
                    }
                }
            }
        }
        stage('Tag latest'){
            steps{
                echo 'Tagging latest'
                script{
                    docker.withRegistry("${env.DOCKER_REGISTRY}","${env.DOCKER_CRED}")
                    {
                        docker.image("${env.IMAGE_NAME}:${env.VERSION}")
                        image.push('latest')
                    }
                }
            }
        }
        post{
            always{
                cleanWs()
            }
        }
        
    }
}
