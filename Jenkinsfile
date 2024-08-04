pipeline {
    agent any
    environment{
        DOCKER_IMAGE = 'claxmih/lms'
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/'
        REGISTRY_CREDENTIALS_ID = '28716a9a-1996-49aa-9ecb-6aa380f09462'
    }
    
    stages {
        stage('Clean Up Workspace') {
           steps {
                   echo 'Cleaning Work Space'

            }
        }
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
        
        stage('Run Docker Script') {
            steps {
                script {
                    // Ensure the script is executable
                    dir('./webapp'){
                    sh 'chmod +x docker_script.sh'
                    // Verify the script is executable
                        sh 'ls -la docker_script.sh'
                    
                    // Run the docker_script.sh to build the Docker image
                    sh './docker_script.sh'
                    }
                }
            }
        }
        
        stage('Push Docker Image'){
            steps{
                echo 'Pushing image'
                script {
                    // Docker registry login using a single credentials ID
                    withCredentials([usernamePassword(credentialsId: '28716a9a-1996-49aa-9ecb-6aa380f09462', usernameVariable: 'claxmih', passwordVariable: 'Claxmi@1999')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                    
                    // Tag the Docker image
                    sh 'docker tag claxmih/lms claxmih/lms:${version}'
                    
                    // Push the Docker image
                    sh 'docker push claxmih/lms:${version}'
            }
            echo 'Pushed'
        }
        
    }
}

