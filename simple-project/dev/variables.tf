variable "cidr_block" {
  description = "CIDR block to assign to VPC"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "tags" {
  description = "VPC tags"
  type = map(string)
  default = {}
}