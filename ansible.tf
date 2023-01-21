

# Security Group

resource "aws_security_group" "ansible" {
  name        = "ansible"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "ansible-security-group"
  }
}

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

output "latest_ubuntu_ami" {
  value = data.aws_ami.ubuntu.id
}

# Instance 

resource "aws_instance" "ansible" {
  ami             = data.aws_ami.ubuntu.image_id
  instance_type   = "t2.micro"
  key_name        = "learn-ansible-key"
  security_groups = [aws_security_group.ansible.name]
  user_data       = <<EOF
#!/bin/bash

# Update package index
sudo apt-get update

# Add the Ansible package repository to the list of sources
sudo apt-add-repository ppa:ansible/ansible

# Update package index again to include the new repository
sudo apt-get update

# Install Ansible
sudo apt-get install -y ansible

# Check the version of Ansible that was installed
ansible --version
#
EOF

  tags = {
    "Name" = "Ansible-Server"
  }
}


output "instance_ip" {
  value = aws_instance.ansible.public_ip
}

