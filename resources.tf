resource "aws_vpc" "dev" {
    cidr_block = var.aws_ip_cidr_range
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      "Name" = "dev-vpc"
    } 
}

resource "aws_subnet" "public-subnet" {
    cidr_block = "${cidrsubnet(aws_vpc.dev.cidr_block, 3, 1)}"
    vpc_id = "${aws_vpc.dev.id}"
    availability_zone = "us-east-1c"

    tags = {
      "Name" = "public-subnet"
    }

}

resource "aws_subnet" "private-subnet" {
    cidr_block = "${cidrsubnet(aws_vpc.dev.cidr_block, 2, 2)}"
    vpc_id = aws_vpc.dev.id
    availability_zone = "us-east-1d"
    
    tags = {
      "Name" = "private-subnet"
    }
}


# ------------------------------------------------------aws_security-group-----------------------------------------------------------------
resource "aws_security_group" "allow_tls" {
    vpc_id = aws_vpc.dev.id


ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [aws_vpc.dev.cidr_block]
}

ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [aws_vpc.dev.cidr_block]
}


egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

    tags = {
        Name = "dev-sg"
    }
}