module "vpc" {
  source              = "./terraform-aws-vpc"
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  vpc_cidr            = var.vpc_cidr
}

module "key_pair" {
  source = "./terraform-aws-keypair"
}

module "instance" {
  source         = "./terraform-aws-instance"
  AWS_REGION     = var.AWS_REGION
  INSTANCE_TYPE  = var.INSTANCE_TYPE
  production-vpc = module.vpc.vpcid
  aws_key_pair   = module.key_pair.aws_key_pair
  myPublicSubnet = module.vpc.public-subnet
}