pipeline {
  agent any

  stages {
    stage ('Create AWS Instances') {
      steps {
        sh 'terraform init'
        sh 'terraform plan'
        sh 'echo 'yes' | terraform apply'
        }
    }
  }
}