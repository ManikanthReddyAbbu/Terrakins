provide "aws" {
    region = "us-east-2"
    shared_credentials_file = "/Users/tf_user/.aws/creds-2"
    profile = "customprofile" 
}

/*data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  } */

resource "aws_instance" "myEC2_instance" {
  ami           = "ami-04781752c9b20ea41"
  instance_type = "t2.micro"

  tags = {
    Name = "Terra-kins"
  }
}

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
}
