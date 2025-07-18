resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = ["${aws_subnet.private_1.id}", "${aws_subnet.private_2.id}"]
  transit_gateway_id = data.terraform_remote_state.tgw.outputs.tgw_id
  vpc_id             = aws_vpc.this.id

  appliance_mode_support                          = "disable"
  dns_support                                     = "disable"
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true

  tags = {
    Name = "${var.env}-NATGWVPC-tgw-attachment"
  }
}


