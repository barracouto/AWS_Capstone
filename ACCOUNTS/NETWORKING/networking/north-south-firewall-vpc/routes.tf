#######################
# GWLBE Endpoint 1 route table
#######################
resource "aws_route_table" "gwlbe-private-rt-az1" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "gwlbe-private-rt-az1"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private_az1_assoc" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.gwlbe-private-rt-az1.id
}

resource "aws_route" "gwlbe_az1_to_tgw" {
  route_table_id         = aws_route_table.gwlbe-private-rt-az1.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.terraform_remote_state.tgw.outputs.tgw_id
}


#######################
# GWLBE Endpoint 2 route table
#######################

resource "aws_route_table" "gwlbe-private-rt-az2" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "gwlbe-private-rt-az2"
    Environment = var.env
  }
}
resource "aws_route_table_association" "private_az2_assoc" {
  subnet_id      = aws_subnet.private_az2.id
  route_table_id = aws_route_table.gwlbe-private-rt-az2.id
}

resource "aws_route" "gwlbe_az2_to_tgw" {
  route_table_id         = aws_route_table.gwlbe-private-rt-az2.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = data.terraform_remote_state.tgw.outputs.tgw_id
}


#######################
# TGW 1 route table
#######################
resource "aws_route_table" "tgw-private-rt-az1" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "tgw-private-rt-az1"
    Environment = var.env
  }
}

resource "aws_route_table_association" "tgw-subnet-az1_assoc" {
  subnet_id      = aws_subnet.tgw-subnet-az1.id
  route_table_id = aws_route_table.tgw-private-rt-az1.id
}

# resource "aws_route" "tgw_gwlbe_az1" {
#   route_table_id         = aws_route_table.tgw-private-rt-az1.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = var.gwlbe_endpoint_az1
# }

#######################
# TGW 2 route table
#######################
resource "aws_route_table" "tgw-private-rt-az2" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = "tgw-private-rt-az2"
    Environment = var.env
  }
}

resource "aws_route_table_association" "tgw-subnet-az2_assoc" {
  subnet_id      = aws_subnet.tgw-subnet-az2.id
  route_table_id = aws_route_table.tgw-private-rt-az2.id
}

# resource "aws_route" "tgw_gwlbe_az2" {
#   route_table_id         = aws_route_table.tgw-private-rt-az2.id
#   destination_cidr_block = "0.0.0.0/0"
#   vpc_endpoint_id        = var.gwlbe_endpoint_az2
# }

