def slackResponse = slackSend(channel: "terrakins", message: "BUILD ALERT")

pipeline {
  
agent any
stages {
  stage('Terraform Setup') {
    steps {
      sh ' echo "Started..!! " '
     // sh 'sudo mkdir /home/ubuntu/terraform-jenkins'
     // sh 'sudo cp -r /home/ubuntu/terraform-jenkins /usr/local/bin/'
      sh 'sudo cp -r /var/lib/jenkins/workspace/Terrakins_master /usr/local/bin/'      
      sh 'sudo cp -r /home/ubuntu/.aws/credentials /usr/local/bin/Terrakins_master/'
      sh 'cd /usr/local/bin/Terrakins_master/'
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
      sudo git clone https://github.com/ManikanthReddyAbbu/Terrakins.git
    }
  } */

  stage('Terraform init') {
    steps {
       sh 'cd /usr/local/bin/Terrakins_master/'
       sh 'sudo terraform init'

    }
  }

  stage('Terraform Plan') {
    steps {

      sh 'sudo terraform plan'
    }
  }

  stage('Terraform apply') {
    steps {    
      sh 'cd /usr/local/bin/Terrakins_master/'
      sh 'sudo terraform apply -auto-approve'    
    }
  }

  stage('Terraform Ended') {
    steps {
        slackSend(channel: slackResponse.channelId, message: "Build : ${env.JOB_NAME} successful ${env.BUILD_URL}", timestamp: slackResponse.ts)
        sh 'echo "The End..!!" '
    }
  }

}

}