terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "test_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    key_name = "ne-ac-key"
    tags = {
        name = "terrafrom created by ec2"
 }
 output "instance_id" {
   value = "aws_instance.test_instance.id"
 }
 output "public_id"{
    value = "aws_instance.test.public.id"
 }
 

}
