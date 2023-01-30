terraform {
  backend "s3" {
    bucket = "terraform-state-files-pankaj"
    encrypt = true
    key    = "node/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-files-pankaj"
  }
}
