data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./modules/vpc"

  name            = "${var.environment}-vpc"
  cidr            = var.vpc_cidr
  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  environment     = var.environment
}

module "security" {
  source = "./modules/security"

  vpc_id         = module.vpc.vpc_id
  environment    = var.environment
  allowed_ssh_ip = var.allowed_ssh_ip
}

module "webserver" {
  source = "./modules/ec2"

  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security.security_group_id
  instance_type     = var.instance_type
  environment       = var.environment
}