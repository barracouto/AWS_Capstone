terraform {
  backend "s3" {
    bucket  = "dev-aws-capstone-tf-state"
    key     = "dev/security/alb-sg/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}