
variable "availability_zones" {
  type = map(any)
  default = {
    zone1 = "us-east-1a"
    zone2 = "us-east-1b"
  }
}

variable "cidr_block" {
  default = "10.0.0.0/16"

}