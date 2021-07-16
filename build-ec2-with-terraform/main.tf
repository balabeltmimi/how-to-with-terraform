terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = "~> 1.0.2"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0d058fe428540cd89"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-083af83e9f0092924"]
  subnet_id              = "subnet-07a5c87338403f38f"
  tags = {
    "Name" = "app-server-terraform"
  }
}