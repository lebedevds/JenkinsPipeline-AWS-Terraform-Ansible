provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "bucket" {
  provider = aws
  bucket = "mybacket1.test5.com"
  acl = "public-read"
}
resource "aws_instance" "build" {
  ami = "ami-0dd9f0e7df0f0a138"
  instance_type = "t2.micro"
  tags = {
    Name = "build"
  }
  subnet_id = "subnet-421eb929"
  vpc_security_group_ids = [
    aws_security_group.my-secgroup.id]
  key_name = "MyKeyPair"

}
resource "aws_instance" "app" {
  ami = "ami-0dd9f0e7df0f0a138"
  instance_type = "t2.micro"
  tags = {
    Name = "app"
  }
  subnet_id = "subnet-421eb929"
  key_name = "MyKeyPair"
  vpc_security_group_ids = [
    aws_security_group.my-secgroup.id]

}

resource "aws_security_group" "my-secgroup" {
  name        = "my-security-group"

ingress {
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

}
