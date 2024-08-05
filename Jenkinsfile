pipeline {
    agent any
    environment{
        DOCKER_IMAGE = 'claxmih/lms'
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_CREDENTIALS_ID = '28716a9a-1996-49aa-9ecb-6aa380f09462'
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
                    //    sh 'ls -la docker_script.sh'
                    
                    // Run the docker_script.sh to build the Docker image
                    sh './docker_script.sh'
                    }
                }
            }
        }
        
        stage('Push to Docker Registry') {
            steps {
                echo 'Pushing'
                script {
                    // Log in to Docker registry
                    
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                    
                    // Tag the image (optional, if needed)
                    sh "docker tag ${DOCKER_IMAGE_NAME}/${version}"

                    // Push the image to the Docker registry
                    sh "docker push ${DOCKER_REGISTRY}/${version}"
                }
                echo 'Pushed finally'
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    def imageName = "${DOCKER_IMAGE_NAME}:${version}"
                    sh "docker run -d -p 3000:3000 ${DOCKER_REGISTRY}/${imageName}"
                }
            }
        }
    }
}

