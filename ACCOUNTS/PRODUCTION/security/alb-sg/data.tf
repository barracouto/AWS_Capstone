data "terraform_remote_state" "prod_vpc" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}