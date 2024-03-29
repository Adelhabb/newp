pipeline {
    agent any
    environment {
        PM_API_URL = "https://192.168.217.128:8006/#v1:0:18:4:9:=contentIso:::7::=apitokens"
        PM_USER = "root"
        PM_PASSWORD = "adminprox"
        TEMPLATE = "temp"
        TARGET_NODE = "pve"
        TARGET_STORAGE = "local-lvm"
        BRIDGE = "vmbr0"
        DISK_SIZE = "1G"
        OS_TYPE = "l26"
    }
    stages {
        stage('Test GitHub Connection') {
            steps {
                script {
                    def gitUrl = 'https://github.com/Adelhabb/newp.git'
                    // Checkout the GitHub repository using configured credentials
                    checkout([$class: 'GitSCM',
                              branches: [[name: '*/main']],
                              doGenerateSubmoduleConfigurations: false,
                              extensions: [[$class: 'CloneOption', depth: 1, noTags: false, reference: '', shallow: true]],
                              userRemoteConfigs: [[url: gitUrl]]])
                    echo "Connection to GitHub repository successful"
                }
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
               sh 'terraform plan -var="template=tmpsouha" -out=tfplan'
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
