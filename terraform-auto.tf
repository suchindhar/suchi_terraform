# terraform block 
terraform {
 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      
    }
  }
}
#provider block
provider "aws" {
  region  = "ap-south-1"
  
}
#resource block 
resource "aws_instance" "Suchindhar" {
  ami           = "ami-0a1b648e2cd533174"
  instance_type = "t2.micro"
  key_name   = "new"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]
  tags = {
    Name = "Suchi"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



