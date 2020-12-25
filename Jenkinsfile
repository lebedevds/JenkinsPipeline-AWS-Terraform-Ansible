pipeline {
  agent any

  stages {
    stage (Create Instances){
      steps {
        sh 'terraform init'
        sh 'terraform plan'
        sh 'echo 'yes' | terraform apply'
      }

    }
  }

}