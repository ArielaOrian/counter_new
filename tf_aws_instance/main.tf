terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0d563aeddd4be7fff"
  instance_type = "t2.micro"
 

  tags = {
    Name = var.instance_name
  }
}
#vpc-05a543806688ca815
#subnet-07f73924ee58c2578