pipeline {
  agent any

  stages {
    stage ('Create AWS Instances') {
      steps {
        sh 'terraform init'
        sh "echo 'yes' | terraform apply"
        }
    }
    stage ('Provisioning Build and App Servers') {
      steps {
        ansiblePlaybook(
          become: true,
          becomeUser: 'ubuntu',
          installation: 'ansible',
          disableHostKeyChecking: true,
          credentialsId: 'AWS-key',
          vaultCredentialsId: 'AWS_ACCESS_KEY',
          playbook: './ansible-playbook.yml',
          inventory: './aws_ec2.yml')
      }
    }

  }
}