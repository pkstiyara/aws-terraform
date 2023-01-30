# Instance 
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "owner-id"
    values = ["099720109477"]
  }
}

variable "sg_name" {
  description = "Name for the seccurity group"
  type = map(string)
  default = { "Name" = "Node-Security-Group", "created-by" = "terraform"}
  }

variable "instance_name" {
  description = "Instance Name"
  type        = map(string)
  default     = { "Name" = "Node-Instance", "created-by" = "terraform" }
  
}

variable "sg_name-main" {
  default = "sg"
}