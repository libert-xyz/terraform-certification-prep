terraform {
  backend "remote" {
    organization = "nuvops"

    workspaces {
      name = "101"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  # }
}