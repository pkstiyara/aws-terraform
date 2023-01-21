resource "aws_vpc" "dev-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
}

resource "aws_subnet" "public-subnet" {
  cidr_block        = cidrsubnet(aws_vpc.dev-vpc.cidr_block, 1, 1)
  vpc_id            = aws_vpc.dev-vpc.id
  availability_zone = var.availability_zones.zone1
}

resource "aws_subnet" "private-subnet" {
  cidr_block        = cidrsubnet(aws_vpc.dev-vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.dev-vpc.id
  availability_zone = var.availability_zones.zone2
}