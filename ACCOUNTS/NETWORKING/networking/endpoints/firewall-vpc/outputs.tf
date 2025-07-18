output "ssm_endpoint_id" {
  value = aws_vpc_endpoint.ssm.id
}

output "ssmmessages_endpoint_id" {
  value = aws_vpc_endpoint.ssmmessages.id
}

output "ec2messages_endpoint_id" {
  value = aws_vpc_endpoint.ec2messages.id
}

output "ssm_endpoint_sg_id" {
  description = "The ID of the SSM endpoint security group"
  value       = aws_security_group.this.id
}
