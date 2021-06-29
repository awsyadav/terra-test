

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-12345678"
  instance_type = "t1.micro"
  tags {
    Name = "HelloWorld"
  }
