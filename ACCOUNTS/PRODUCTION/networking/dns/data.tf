data "terraform_remote_state" "prod_alb" {
  backend = "s3"
  config = {
    bucket = "prod-aws-capstone-tf-state"
    key    = "prod/compute/alb/terraform.tfstate"
    region = "us-east-2"
  }
}