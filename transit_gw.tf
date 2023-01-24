resource "aws_ec2_transit_gateway" "lab-tgw-1" {
  amazon_side_asn                 = var.aws_asn
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"

  tags = {
    Name = "lab-tgw-1"
  }
}

resource "aws_ec2_transit_gateway_route" "tgw_default_route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_edge.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.lab-tgw-1.association_default_route_table_id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_edge" {
  subnet_ids         = [aws_subnet.lab-subnet-prv.id]
  transit_gateway_id = aws_ec2_transit_gateway.lab-tgw-1.id
  vpc_id             = aws_vpc.lab-vpc-1.id
}
