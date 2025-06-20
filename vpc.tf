## Add a vnet for each region
## Values for each region from the region .tfvars file
resource "aws_vpc" "vpc01" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = false
  enable_dns_hostnames = false
  instance_tenancy     = "default"
}

# Restrict all traffic on default security group
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc01.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
