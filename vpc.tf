## Add a vnet for each region
## Values for each region from the region .tfvars file
resource "aws_vpc" "vpc01" {
  # IP/CIDR range comes from regional tfvars var
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

# Add a pubic and private subnet for each region
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = var.subnet1_public_cidr

  tags = {
    "Name" = "sjb-${region_prefix}-public-1"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = var.subnet1_private_cidr

  tags = {
    "Name" = "sjb-${region_prefix}-private-1"
  }
}

# Add a second private subnet for eu-north-1/Stockholm only
resource "aws_subnet" "private2" {
  count      = var.just_eu_north_1 == true ? 1 : 0
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = var.subnet2_private_cidr

  tags = {
    "Name" = "sjb-${region_prefix}-private-2"
  }
}
