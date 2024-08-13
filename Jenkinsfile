pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-cred', url: 'https://github.com/cloudtechtrainer/B9-DevOps-Jen-Ter-Ans.git']])
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                        sh """ 
                        #!/bin/bash
                        ls -l
                        pwd
                        cd /var/lib/jenkins/workspace/terra-ansi-pipeline/Terraform
                        ls -l
                        pwd
                        terraform init
                        """
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh """ 
                    cd /var/lib/jenkins/workspace/terra-ansi-pipeline/Terraform                    
                    terraform apply -auto-approve tfplan
                    """
                }
            }
        }

        stage('Ansible Configuration') {
            steps {
                script {
                    sh """ 
                        #!/bin/bash
                        ls -l
                        pwd
                        cd /var/lib/jenkins/workspace/terra-ansi-pipeline/Ansible
                        ls -l
                        ansible-playbook -i inventory.ini playbook.yml
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
