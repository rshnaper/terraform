variable "cidr_block" {
  description = "CIDR block to assign to VPC"
  type = list(string)
}

variable "vpc_name" {
  description = "VPC name"
}

variable "tags" {
  description = "VPC tags"
  type = map(string)
  default = {}
}

variable "aws_region" {
  default = "ca-central-1"
}

variable "aws_endpoint" {
  default = ""
}

variable "environment" {
  description = "Environment"
  default = "local"
}