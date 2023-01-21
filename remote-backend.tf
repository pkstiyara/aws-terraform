# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }



#   backend "s3" {
#     encrypt = true
#     bucket = "terraform-backend-dalles"
#     key = "ourdatastore/terraform.tfstate"
#     region = "us-west-2"
#   }
# }