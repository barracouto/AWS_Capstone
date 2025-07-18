resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.env}-vpc"
    Environment = var.env
  }
}


resource "aws_subnet" "private_az1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.private_subnet_1_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "gwlbe-subnet-az1"
    Environment = var.env
  }
}

resource "aws_subnet" "private_az2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.private_subnet_2_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "gwlbe-subnet-az2"
    Environment = var.env
  }
}

resource "aws_subnet" "tgw-subnet-az1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.tgw-subnet_1_cidr
  availability_zone       = var.private_subnet_1_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "tgw-subnet-az1"
    Environment = var.env
  }
}

resource "aws_subnet" "tgw-subnet-az2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.tgw-subnet_2_cidr
  availability_zone       = var.private_subnet_2_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "tgw-subnet-az2"
    Environment = var.env
  }
}

