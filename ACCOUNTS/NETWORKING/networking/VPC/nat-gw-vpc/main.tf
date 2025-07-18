resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name        = "${var.env}-natGW-vpc"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-NATGWVPC-igw"
    Environment = var.env
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-NATGWVPC-public-subnet-1"
    Environment = var.env
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.env}-NATGWVPC-public-subnet-2"
    Environment = var.env
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.private_subnet_1_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.env}-NATGWVPC-private-subnet-1"
    Environment = var.env
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.private_subnet_2_az
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.env}-NATGWVPC-private-subnet-2"
    Environment = var.env
  }
}

resource "aws_eip" "nat" {
  tags = {
    Name        = "${var.env}-nat-eip"
    Environment = var.env
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public_1.id

  tags = {
    Name        = "${var.env}-NATGWVPC-nat"
    Environment = var.env
  }

  depends_on = [aws_internet_gateway.this]
}

# PUBLIC ROUTE TABLE + ROUTE
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-NATGWVPC-public-rt"
    Environment = var.env
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

# PRIVATE ROUTE TABLE + ROUTE
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "${var.env}-NATGWVPC-private-rt"
    Environment = var.env
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}
