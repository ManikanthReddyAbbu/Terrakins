provider "aws" {
    region = "us-east-1"
    shared_credentials_file = ["/usr/local/bin/Terrakins_master/credentials"]
    /*access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    shared_credentials_file = "/Users/tf_user/.aws/creds-2"
    profile = "customprofile" */     
}


/*data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  } */
      
resource "aws_instance" "myEC2_instance" {
  ami           = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"
  key_name      = "terraform-jenkins"
//security_groups = ["sshonly"]
  tags = {
    Name = "Terra-kins"
  }
    
    
    provisioner "remote-exec"{
    inline=[
             "sudo apt-get update",
         //  "sudo apt-get install -y nginx1.12",  
         //  "sudo systemctl start nginx",
         //  "sudo apt purge git ",
             "sudo apt-get purge -y apache2 "
           ]
        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = file("/usr/local/bin/Terrakins_master/terraform-jenkins.pem")
          host = "${aws_instance.myEC2_instance.public_ip}"
      }
    
   } 
    
      provisioner "remote-exec"{
    inline=[
             "sudo apt-get update",
           "sudo apt-get install -y nginx1.12",  
           "sudo systemctl start nginx",
         
           ]
        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = file("/usr/local/bin/Terrakins_master/terraform-jenkins.pem")
          host = "${aws_instance.myEC2_instance.public_ip}"
      } 
    
   } 

}
/*
    resource "aws_vpc" "myvpc" {
    cidr_block = "10.10.0.0/16"
    tags = {
        Name = "COVID-19"
    }
}    
    

    resource "aws_s3_bucket" "my_S3_bucket"{
    bucket = "my-tf-test-bucket"
    acl = "private"

    tags = {
        Name = "My Quarantine Bucket"
        Environment = "Dev"
    }
}*/

