pipeline {
    agent any

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
                    def json = readJSON file: 'lms/api/package.json'
                    def version = json.version
                    echo "Version: ${version}"
                }
            }
        }
        stage('BUILD docker image') {
            steps {
                echo 'Building an image'

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
