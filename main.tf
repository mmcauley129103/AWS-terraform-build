terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16" #AWS terraform provider version
    }
  }

  required_version = ">= 1.2.0" # required version of Terraform needed
}

provider "aws" {
  region = "us-east-1" #AWS region
}

resource "aws_instance" "web_server" {
  ami           = "ami-0cff7528ff583bf9a" #Amazon machine image.
  instance_type = "t2.micro"              #type of instance we want
  key_name      = "Windows Key"           #key name that I created in AWS so we can ssh into the instance
  security_groups = [ "launch-wizard-1" ] #security group in AWS.  Use group name, not ID
  tags = {
    Name = "Webserver1" #name of the instance

  }
}
