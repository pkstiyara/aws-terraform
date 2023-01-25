
# # Security Group

# resource "aws_security_group" "sonar" {
#   name        = "sonar"
#   description = "Allow SSH and HTTP traffic"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
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
#     "Name" = "sonar-security-group"
#   }
# }

# # Instance 

# resource "aws_instance" "sonar" {
#   ami             = data.aws_ami.ubuntu.image_id
#   instance_type   = "t2.micro"
#   key_name        = "sonar"
#   security_groups = [aws_security_group.sonar.name]
#   user_data       = <<EOF
#   #!/bin/bash

# # Update package list
# sudo apt-get update
# # Install Java 11
# sudo apt-get install -y openjdk-11-jdk


# EOF

#   tags = {
#     "Name" = "Sonar-Server"
#   }
# }



