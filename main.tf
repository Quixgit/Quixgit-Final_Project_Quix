provider "aws" {
  region = "eu-north-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "quix-eks"
  cluster_version = "1.23"
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  node_groups = {
    default = {
      desired_capacity = 1
      max_size         = 2
      min_size         = 1

      instance_type = "t3.micro"
    }
  }
}
