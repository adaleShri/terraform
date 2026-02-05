terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t3.micro"
  key_name      = "new-ac-key"   # <-- NO .pem file

  tags = {
    Name = "terraform-created-ec2"
  }
}

# -------- OUTPUTS MUST BE OUTSIDE THE RESOURCE --------

output "instance_id" {
  value = aws_instance.test_instance.id
}

output "public_ip" {
  value = aws_instance.test_instance.public_ip
}

