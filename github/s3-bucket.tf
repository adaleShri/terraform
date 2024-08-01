provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_s3_bucket" "name-11" {
    bucket = "terrafrom-buc1"
    tags = {
        name = "my-bucket"
        Environment = "stag"
    }
  
}