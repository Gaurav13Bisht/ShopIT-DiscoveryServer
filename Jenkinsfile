pipeline{
    agent any
    tools{
        maven 'maven_3_8_8'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Gaurav13Bisht/ShopIT-DiscoveryServer']])
                bat 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    bat 'docker build -t gaurav13bisht/shopit-discovery-server .'
                }
            }
        }
        stage('Push Image to DockerHub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd3', variable: 'dockerhubpwd')]) {
                        bat "docker login -u gaurav13bisht -p ${dockerhubpwd}"
                    }
                    bat 'docker push gaurav13bisht/shopit-discovery-server'
                }
            }
        }
    }
}