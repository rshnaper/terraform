module "vpc" {
  for_each = toset(var.cidr_block)
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc_name
  cidr = each.key
  tags = var.tags
}