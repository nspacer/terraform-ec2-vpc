variable "AMIS" {
  type = map(string)
  default = {
    "us-east-1" = "ami-024fc608af8f886bc"
    "eu-west-1"    = "ami-096f43ef67d75e998"
    "eu-west-2"    = "ami-0ffd774e02309201f"
  }
}
variable "AWS_REGION" {}
variable "INSTANCE_TYPE" {}
variable "sgPortsPublic" {
  type    = list(number)
  default = [22, 80]
}

variable "subnets" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "production-vpc" {
  type = any
}

variable "aws_key_pair" {
  type = any
}

variable "myPublicSubnet" {
  type = any
}