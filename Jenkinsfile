pipeline {
    agent {
        label 'windows'
    }

    stages {
        stage('Build image') {
            steps {
                powershell '''
                    cd buildtools
                    docker build -m 2GB -t marcusmaximus/msvc-buildtools:2019 .
                '''
            }
        }
        stage('Deploy image') {
            environment {
                DOCKERHUB = credentials('docker_hub')
            }
            steps {
                powershell '''
                    $env:DOCKERHUB_USR | docker login --username $env:DOCKERHUB_PSW --password-stdin
                    docker push marcusmaximus/msvc-buildtools:2019
                    docker logout
                '''
            }
        }
    }
}