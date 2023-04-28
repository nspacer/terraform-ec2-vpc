terraform {
  backend "s3" {
    bucket         = "terraform-state-information-btc-09"
    region         = "us-east-1"
    key            = "state/terraform.tfstate"
    dynamodb_table = "dynamodb-state-information"
  }
}