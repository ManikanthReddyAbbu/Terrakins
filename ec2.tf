provider "aws" {
    region = "us-east-1"
    shared_credentials_files = ["/usr/local/bin/Terrakins_master/credentials"]
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
/*
resource "aws_key_pair" "terraform-jenkins" {
  key_name   = "terraform-jenkins"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdjnNZSM+VY06x0vIMELiF+xZ+kweaHtHrrpQRDasG/iIyHlu1GdEy+rtq7XP63o4vDzmLDwHDRJb9RpYQtJ7d8mrUMsxexoZJq3+4yEyjzUAm8VD+YPQDk0Is+5NuC/TFWk+6c9zAhA5i/w0mBdHRno+bi5ugU3NpNMNfWa0/l6Y2N9DFz8Ld3XdPVzsTqWckuxGJKOQueO5ny9IL1tFCp9+JfHwtzFpb7ELsvYGHnvzWO8T0rL4558jpOm8wxmhHL4LqzHWcYA/qbkD6onvRwFU6DV4x6ISeoAAdaLnLqqX+IL3WkvIFWX/8tP4RdJAhOECxS8bU89Mf250VH2M1 Jenkins"
}
  */  
resource "aws_instance" "myEC2_instance" {
  ami           = "ami-0b49a4a6e8e22fa16"
  instance_type = "t2.micro"
  key_name      = "Jenkins"
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
          host = "${aws_instance.myEC2_instance.public_ip}"
          private_key = "${file("/usr/local/bin/Terrakins_master/terraform-jenkins.pem")}"
          
      }
    
   } 
    
}   
 /*   
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

*/
/*
    resource "aws_vpc" "myvpc" {
    cidr_block = "10.10.0.0/16"
    tags = {
        Name = "COVID-19"
    }
} */   
    

    resource "aws_s3_bucket" "my_S3_bucket"{
    bucket = "my-tf-test-bucket"
    acl = "private"

    tags = {
        Name = "My Quarantine Bucket"
        Environment = "Dev"
    }
}

