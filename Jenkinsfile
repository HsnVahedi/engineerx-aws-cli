pipeline {
    agent any
    stages {
        stage('Build CLI Image') {
            steps {
                script {
                    withDockerRegistry([ credentialsId: "dockerhub-repo", url: "" ]) {
                        def image = docker.build("hsndocker/aws-cli:latest")
                        image.push()
                    }
                }
            }
        } 
    }
}