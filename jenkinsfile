pipeline {
    agent any
    environment {
        TF_CLI_ARGS = "-input=false" // Set Terraform to non-interactive mode
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform files from version control
                git 'https://your-repo-url.git'
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Plan Terraform changes
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                sh 'terraform apply tfplan'
            }
        }
    }
    post {
        always {
            // Cleanup any temporary files if needed
            sh 'rm -rf .terraform terraform.tfstate tfplan'
        }
    }
}
