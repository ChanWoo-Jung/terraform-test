provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_instance" "example" {
  ami		= "ami-0f3a440bbcff3d043"
  instance_type = "t3.micro"
  
  tags = {
    Name = "terraform-example"
  }
}
