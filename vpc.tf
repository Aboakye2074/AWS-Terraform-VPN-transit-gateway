resource "aws_vpc" "lab-vpc-1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "lab-vpc-1"
  }
}

resource "aws_subnet" "lab-subnet-prv" {
  vpc_id                  = aws_vpc.lab-vpc-1.id
  cidr_block              = var.private_subnets[0]
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "lab-subnet-prv"
  }
}

resource "aws_default_route_table" "lab-rt-1" {
  default_route_table_id = aws_vpc.lab-vpc-1.default_route_table_id

  tags = {
    Name = "lab-rt-1"
  }
}

resource "aws_route_table_association" "lab-associate-prv" {
  subnet_id      = aws_subnet.lab-subnet-prv.id
  route_table_id = aws_default_route_table.lab-rt-1.id
}

resource "aws_route" "lab-rt-1-default" {
  route_table_id         = aws_default_route_table.lab-rt-1.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = aws_ec2_transit_gateway.lab-tgw-1.id
  depends_on = [
    aws_ec2_transit_gateway.lab-tgw-1
  ]

}
