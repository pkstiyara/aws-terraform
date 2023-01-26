module "aws_vpc" {
    source = "./modules/aws_vpc"
  
}

module "aws_subnets" {
    source = "./modules/aws_subnets"
  
}

module "aws_route" {
    source = "./modules/aws_route"
  
}

module "aws_ig" {
    source = "./modules/aws_ig"
  
}

module "aws_sg" {
    source = "./modules/aws_sg"
  
}

module "aws_instances" {
  source = "./modules/aws.instances"
  
}