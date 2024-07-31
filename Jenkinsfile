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
        stage('BUILD docker image') {
            steps {
                echo 'Building an image'
                script{
                    sh 'docker build -t Claxmih/lms -f webapp/Dockerfile .'
                    sh 'docker tag $DOCKER_IMAGE $DOCKER_REGISTRY/$DOCKER_IMAGE:$version'
                }
                echo 'Buidling success'
            }
        }
        stage('Push Docker Image'){
            steps{
                echo 'Pushing image'
            }
        }
        stage('Tag latest'){
            steps{
                echo 'Tagging latest'
            }
        }
        stage('Clean Up Workspace') {
           steps {
                   echo 'Cleaning Work Space'

            }
        }
}
}
