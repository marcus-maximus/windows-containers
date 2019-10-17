pipeline {
    agent {
        label 'windows'
    }

    stages {
        stage('Build image buildtools-base') {
            steps {
                powershell '''
                    cd buildtools_base
                    docker build -m 2GB -t marcusmaximus/msvc-buildtools-base:2019 .
                '''
            }
        }
        stage('Build image buildtools-cpp') {
            steps {
                powershell '''
                    cd buildtools_cpp
                    docker build -m 2GB -t marcusmaximus/msvc-buildtools-cpp:2019 .
                '''
            }
        }
        stage('Push images to docker hub') {
            environment {
                DOCKERHUB = credentials('docker_hub')
            }
            steps {
                powershell '''
                    $env:DOCKERHUB_USR | docker login --username $env:DOCKERHUB_PSW --password-stdin
                    docker push marcusmaximus/msvc-buildtools-base:2019
                    docker push marcusmaximus/msvc-buildtools-cpp:2019
                    docker logout
                '''
            }
        }
    }
}