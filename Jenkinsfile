pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gargmukku07/terraform-1.git']])
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'terraform fmt'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'mycred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY')]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def user_input = input(
                        id: 'Tf_action', message: 'Please select Apply or Destroy', parameters: [
                            choice(choices: ['apply', 'destroy'], name: 'ACTION')
                            ]
                    )
                    withCredentials([usernamePassword(credentialsId: 'mycred', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY')]) {
                        sh """
                            echo $user_input
                            terraform $user_input --auto-approve

                        """
                    }
                }
                
            }
        }
    }
}