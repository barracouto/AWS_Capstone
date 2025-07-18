output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "tgw_attachment_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.this.id
  description = "The ID of the Transit Gateway VPC attachment"
}

output "private_subnet_az1_id" {
  value       = aws_subnet.private_az1.id
  description = "Private subnet AZ1 ID"
}

output "private_subnet_az2_id" {
  value       = aws_subnet.private_az2.id
  description = "Private subnet AZ2 ID"
}

output "tgw_subnet_az1_id" {
  value       = aws_subnet.tgw-subnet-az1.id
  description = "TGW subnet AZ1 ID"
}

output "tgw_subnet_az2_id" {
  value       = aws_subnet.tgw-subnet-az2.id
  description = "TGW subnet AZ2 ID"
}
