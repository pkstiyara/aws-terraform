
# # Security Group

# resource "aws_security_group" "node" {
#   name        = "node"
#   description = "Allow SSH and HTTP traffic"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#    ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#    ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     "Name" = "node-security-group"
#   }
# }



# # Instance 

# resource "aws_instance" "node" {
#   ami             = data.aws_ami.ubuntu.image_id
#   instance_type   = "t2.micro"
#   key_name        = "sonar"
#   security_groups = [aws_security_group.node.name]
#   count           = "1"
#   user_data       = <<EOF
# #!/bin/bash

# # Update package index
# sudo apt-get update

# EOF

#   tags = {
#     "Name" = "eks-controller"
#   }
# }



