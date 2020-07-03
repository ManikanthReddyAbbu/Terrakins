pipeline {

agent any
stages {
  stage('Terraform Setup') {
    steps {
      sh ' echo "Started..!! " '
      sh 'sudo mkdir terraform-jenkins'
      sh 'sudo cp /home/ubuntu/terraform-jenkins /usr/local/bin/'
      sh  'cp /var/lib/jenkins/workspace/Terraform_Jenkins/Terrakins/ec2.tf /usr/local/bin/terraform-jenkins/'
    }
  }

  stage("cloning project from git"){
          steps {
              sh 'sudo rm -r Terrakins/;git clone https://github.com/ManikanthReddyAbbu/Terrakins.git'
            
          }
        } 
 /* stage('Git Clone') {
    steps {
      sh 'sudo rm -r Terraform_Jenkins/;
      sudo git clone https://github.com/ManikanthReddyAbbu/Terrafom_Jenkins.git'
    }
  } */

  stage('Terraform init') {
    steps {
       sh "sudo cd /usr/local/bin/terraform-jenkins/terraform init"
       // sh "cd terraform-jenkins/ && /usr/local/bin/terraform-jenkins/terraform init"
    }
  }

  stage('Terraform Plan') {
    steps {
      sh 'sudo cd /usr/local/bin/terraform-jenkins/terraform plan'
    }
  }

  stage('Terraform apply') {
    steps {
      sh 'sudo cd /usr/local/bin/terraform-jenkins/terraform apply'
      
    }
  }

  stage('Terraform Ended') {
    steps {
        sh 'echo "The End..!!" '
    }
  }

}

}
