locals {
  environment = "local"
}

module "myVpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc_name
  cidr = var.cidr_block
  tags = merge({"environment" = local.environment}, var.tags)
}