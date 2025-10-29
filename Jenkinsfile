pipeline {
  agent any

  environment {
    AWS_REGION = 'ap-south-1'
    TF_IN_AUTOMATION = 'true'
  }

  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        sh '''
          echo "==> Initializing Terraform backend"
          terraform init -input=false
        '''
      }
    }

    stage('Validate Terraform') {
      steps {
        sh '''
          echo "==> Checking Terraform Version"
          terraform -version
          echo "==> Validating Terraform syntax"
          terraform validate
        '''
      }
    }

    stage('Terraform Plan') {
      steps {
        sh '''
          echo "==> Running Terraform plan"
          terraform plan -input=false -out=tfplan
        '''
      }
    }

    stage('Manual Approval') {
      steps {
        input message: 'Approve deployment?', ok: 'Deploy'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh '''
          echo "==> Applying Terraform changes"
          terraform apply -input=false tfplan
        '''
      }
    }
  }

  post {
    success {
      echo '✅ Terraform pipeline completed successfully!'
    }
    failure {
      echo '❌ Pipeline failed!'
    }
  }
}
