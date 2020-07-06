#!/bin/bash
pipeline {
  
agent any

stages {
  stage('Terraform Setup') {
    steps {
      sh ' echo "Started..!! " '
     // sh 'sudo mkdir /home/ubuntu/terraform-jenkins'
     // sh 'sudo cp -r /home/ubuntu/terraform-jenkins /usr/local/bin/'
      sh 'sudo cp -r /var/lib/jenkins/workspace/Terraform_Jenkins /usr/local/bin/'
    }
  }

 /* stage("cloning project from git"){
          steps {
              sh 'sudo rm -r Terrakins/;git clone https://github.com/ManikanthReddyAbbu/Terrakins.git'
            
          }
        } 
  stage('Git Clone') {
    steps {
      sh 'sudo rm -r Terraform_Jenkins/;
      sudo git clone https://github.com/ManikanthReddyAbbu/Terrafom_Jenkins.git'
    }
  } */

  stage('Terraform init') {
    steps {
       sh 'cd /usr/local/bin/Terraform_Jenkins/'
       sh 'sudo terraform init'
       // sh 'cd /usr/local/bin/terraform-jenkins/ && sudo terraform init'
       // sh "cd terraform-jenkins/ && /usr/local/bin/terraform-jenkins/terraform init"
    }
  }

  stage('Terraform Plan') {
    steps {
      sh 'cd /usr/local/bin/Terraform_Jenkins/'
      sh 'sudo terraform plan;$AWS_ACCESS_KEY_ID;$AWS_SECRET_ACCESS_KEY' 
    }
  }

  stage('Terraform apply') {
    steps {
      
      sh 'cd /usr/local/bin/Terraform_Jenkins/'
      sh 'export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"'
      sh 'export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"'
      sh 'export AWS_DEFAULT_REGION="us-west-2"'
      sh 'sudo terraform apply -y'

      
    }
  }

  stage('Terraform Ended') {
    steps {
        sh 'echo "The End..!!" '
    }
  }

}

}

