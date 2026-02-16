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