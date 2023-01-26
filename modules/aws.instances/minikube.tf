
# # Security Group

# resource "aws_security_group" "minikube" {
#   name        = "minkube"
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


#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#     ingress {
#     from_port   = 20000
#     to_port     = 20000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# ingress {
#     from_port   = 31200
#     to_port     = 31200
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
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
#     "Name" = "minikube-security-group"
#   }
# }



# # Instance 

# resource "aws_instance" "minikube" {
#   ami             = data.aws_ami.ubuntu.image_id
#   instance_type   = "t2.medium"
#   key_name        = "sonar"
#   security_groups = [aws_security_group.minikube.name]
#   user_data       = <<EOF
# #!/bin/bash

# # Update package list
# sudo apt-get update

# # Install the latest version of Docker
# sudo apt-get install -y docker.io

# # Add the Kubernetes apt repository
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# # Update package list
# sudo apt-get update

# # Install kubeadm, kubelet, and kubectl
# sudo apt-get install -y kubeadm kubelet kubectl

# # Install Minikube
# curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
#   && chmod +x minikube
# sudo mv minikube /usr/local/bin/
# EOF

#   tags = {
#     "Name" = "mini-kube"
#   }
# }



