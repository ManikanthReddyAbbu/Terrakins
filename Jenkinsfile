pipeline {


agent any

stages {
  stage('Terraform Setup') {
    steps {
      sh ' echo "Started..!! " '
      sh 'sudo mkdir /home/ubuntu/terraform-jenkins'
      sh 'sudo cp -r /home/ubuntu/terraform-jenkins /usr/local/bin/'
      sh 'sudo cp /var/lib/jenkins/workspace/Terraform_Jenkins/ec2.tf /usr/local/bin/terraform-jenkins/'
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
       sh 'cd /usr/local/bin/terraform-jenkins/'
       sh 'sudo terraform init'
       // sh 'cd /usr/local/bin/terraform-jenkins/ && sudo terraform init'
       // sh "cd terraform-jenkins/ && /usr/local/bin/terraform-jenkins/terraform init"
    }
  }

  stage('Terraform Plan') {
    steps {
      sh 'cd /usr/local/bin/terraform-jenkins/'
      sh 'sudo terraform plan'
    }
  }

  stage('Terraform apply') {
    steps {
      sh 'cd /usr/local/bin/terraform-jenkins/'
<<<<<<< HEAD
      sh 'sudo terraform apply'
=======
      sh 'sudo terraform apply -y'
>>>>>>> 0d00a8a7b768bdfb0e48b233870035102b7d52f4
      
    }
  }

  stage('Terraform Ended') {
    steps {
        sh 'echo "The End..!!" '
    }
  }

}

}
