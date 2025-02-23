terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}
provider "aws" {
    region = "ap-south-1"
    #shared_config_files = ["/home/ubuntu/.aws/config"]
    #shared_credentials_files = ["/home/ubuntu/.aws/credentials"] 
     #profile = "krishna"    # profile name
 }



# Create a security group aws
resource "aws_security_group" "server_security" {
  name        = "server_security"
  description = "Security group for the server"
   
  # Replace with your VPC ID

  # Allow incoming SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic  hwwwww
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

# Create an EC2 instance
resource "aws_instance" "terrafrom-server" {
  ami           = "ami-068e0f1a600cd311c"  # Replace with your preferred AMI ID
  instance_type = "t2.micro"
  key_name      = "krishna"  # Replace with your key pair name

  # Associate the security group
  vpc_security_group_ids = [aws_security_group.server_security.id]

  tags = {
    Name = "terraform-sg-1"
  }
}
