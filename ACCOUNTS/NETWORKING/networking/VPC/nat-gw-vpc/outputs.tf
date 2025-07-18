output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the NAT Gateway VPC"
}

output "tgw_attachment_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
  description = "The ID of the Transit Gateway VPC attachment for NATGW VPC"
}

output "public_subnet_1_id" {
  value       = aws_subnet.public_1.id
  description = "Public Subnet 1 ID"
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_2.id
  description = "Public Subnet 2 ID"
}

output "private_subnet_1_id" {
  value       = aws_subnet.private_1.id
  description = "Private Subnet 1 ID"
}

output "private_subnet_2_id" {
  value       = aws_subnet.private_2.id
  description = "Private Subnet 2 ID"
}
