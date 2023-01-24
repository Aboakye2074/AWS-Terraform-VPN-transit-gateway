// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_security_group" "lab-sg-1" {
  name        = "lab-sg-1"
  description = "Allow ICMP and SSH traffic via Terraform"
  vpc_id      = aws_vpc.lab-vpc-1.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "lab-ec2-private" {
  ami                         = data.aws_ami.amazon-linux-2.id
  availability_zone           = "${var.AWS_REGION}a"
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  security_groups             = [aws_security_group.lab-sg-1.id]
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.lab-subnet-prv.id

  tags = {
    "Name" = "lab-ec2-private"
  }

}
