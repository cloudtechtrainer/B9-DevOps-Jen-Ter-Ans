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
                        cd /var/lib/jenkins/workspace/infra-automation/Terraform
                        pwd
                        terraform init
                        """
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh """ 
                    cd /var/lib/jenkins/workspace/infra-automation/Terraform                   
                    terraform plan -out=tfplan -parallelism=2
                    """
                }
            }
        }        

        stage('Terraform Apply') {
            steps {
                script {
                    sh """ 
                    cd /var/lib/jenkins/workspace/infra-automation/Terraform                    
                    terraform apply -auto-approve tfplan
                    """
                }
            }
        }

        stage('Wait') {
            steps {
                script {
                    sh """ 
                    sleep 20                   
                    echo 'Waited for Resources to come alive' 
                    """
                }
            }
        }

        stage('Ansible Configuration') {
            steps {
                script {
                    sh """ 
                        #!/bin/bash                        
                        cd /var/lib/jenkins/workspace/infra-automation/Ansible
                        ansible-playbook -i /var/lib/jenkins/workspace/terra-ansi-pipeline/Terraform/public_ips.txt deploy-playbook.yaml --private-key=/var/lib/jenkins/workspace/terra-ansi-pipeline/Ansible/remote-key.pem
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
