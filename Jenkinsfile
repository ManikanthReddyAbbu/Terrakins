pipeline {

agent any
  
stages {
  stage('Terraform Setup') {
    steps {
      sh ' echo "Started..!! " '
      sh 'mkdir terraform-jenkin'
      sh 'cp /home/ubuntu/terraform-jenkin /usr/local/bin/'
      sh 'cp /var/lib/jenkins/workspace/Terraform_Jenkin/Terrakins/ec2.tf /usr/local/bin/terraform-jenkin/'
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
       sh "sudo cd /usr/local/bin/terraform-jenkin/terraform init"
       // sh "cd terraform-jenkins/ && /usr/local/bin/terraform-jenkins/terraform init"
    }
  }

  stage('Terraform Plan') {
    steps {
      sh 'sudo cd /usr/local/bin/terraform-jenkin/terraform plan'
    }
  }

  stage('Terraform apply') {
    steps {
      sh 'sudo cd /usr/local/bin/terraform-jenkin/terraform apply'
      
    }
  }

  stage('Terraform Ended') {
    steps {
        sh 'echo "The End..!!" '
    }
  }

}

}
