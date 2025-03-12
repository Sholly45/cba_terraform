provider "aws" {
  region = "eu-west-2"
}

# Reference the existing VPC
data "aws_vpc" "existing_vpc" {
  id = "vpc-07fc8bac920f81827"
}

# Reference the existing Subnet
data "aws_subnet" "existing_subnet" {
  id = "subnet-0ee562f2fd55d07eb"
}

# Reference the existing Security Group
data "aws_security_group" "existing_sg" {
  id = "sg-0947e510ceb323515"
}

# Create an EC2 instance using the existing resources and assign a public IP automatically
resource "aws_instance" "example" {
  ami                         = "ami-091f18e98bc129c4e"  # Replace with a valid AMI ID for eu-west-2
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnet.existing_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.aws_security_group.existing_sg.id]
  key_name                    = "hush"
  user_data                   = file("install_apache.sh")


  tags = {
    Name = "Terraform-EC2-Instance Ise"
  }
}

