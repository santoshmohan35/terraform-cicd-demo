pipeline {
  agent any

  environment {
    AWS_REGION = 'ap-south-1'
    TF_IN_AUTOMATION = 'true'
  }

  stages {

    stage('Checkout Code') {
      steps {
        echo "📦 Checking out source code..."
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        echo "🚀 Initializing Terraform backend..."
        sh '''
          terraform init -input=false
        '''
      }
    }

    stage('Terraform Checks') {
      parallel {
        stage('Format Check') {
          steps {
            echo "🔍 Checking Terraform formatting..."
            sh 'terraform fmt -check -recursive'
          }
        }
        stage('Validate Syntax') {
          steps {
            echo "🧩 Validating Terraform syntax..."
            sh '''
              terraform -version
              terraform validate
            '''
          }
        }
      }
    }

    stage('Terraform Plan') {
      options { timeout(time: 30, unit: 'MINUTES') }
      steps {
        retry(2) {
          echo "🧠 Running Terraform plan..."
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws-jenkins'
          ]]) {
            sh '''
              echo "==> Refreshing state and generating plan..."
              terraform plan -input=false -out=tfplan
            '''
          }
        }
      }
    }

    stage('Manual Approval') {
      steps {
        input message: '🟢 Approve deployment?', ok: 'Deploy'
      }
    }

    stage('Terraform Apply') {
      options { timeout(time: 45, unit: 'MINUTES') }
      steps {
        retry(2) {
          echo "⚙️ Applying Terraform changes..."
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws-jenkins'
          ]]) {
            sh '''
              terraform apply -input=false -auto-approve tfplan | tee apply.log
            '''
          }
        }
      }
    }
  }

  post {
    always {
      echo "🧾 Archiving Terraform apply logs..."
      archiveArtifacts artifacts: '**/apply.log', fingerprint: true
    }
    success {
      echo '✅ Terraform pipeline completed successfully!'
    }
    failure {
      echo '❌ Terraform pipeline failed!'
    }
  }
}
