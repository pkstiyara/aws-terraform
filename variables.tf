variable "aws_ip_cidr_range" {
  default = "10.0.0.0/16"
  type = string
  description = "IP CIDR range for aws VPC"
}

variable "subnet_names" {
    type = map

    default = {
        subnet1 = "subnetone"
        subnet2 = "subnettwo"
        subnet3 = "subnetthree"
    }
}

// Output variables

output "first_output" {
    value = "this is the value through execution"
}

output "aws_cidr_subnet1" {
    value = aws_subnet.public-subnet.cidr_block
}


// Input variables 