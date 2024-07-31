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
     #profile = "krishna" 
 }



# Create a security group aws
resource "aws_security_group" "example_sg" {
  name        = "terraform-example-sg"
  description = "Security group for Terraform example"
  vpc_id      = "vpc-0ed19d3f73f808d94"  # Replace with your VPC ID

  # Allow incoming SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-example-sg"
  }
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-068e0f1a600cd311c"  # Replace with your preferred AMI ID
  instance_type = "t2.micro"
  key_name      = "krishna.pem"  # Replace with your key pair name

  # Associate the security group
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "terraform-example-instance"
  }
}
