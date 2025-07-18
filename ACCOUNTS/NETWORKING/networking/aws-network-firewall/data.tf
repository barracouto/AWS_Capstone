data "terraform_remote_state" "inspection_vpc" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key    = "networking/networking/firewall/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "ns_inspection_vpc" {
  backend = "s3"
  config = {
    bucket = "networking-aws-capstone-tf-state"
    key     = "networking/networking/firewall/north-south/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
