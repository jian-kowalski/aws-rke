variable "aws_region" {
  type = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

locals {
  subnets_cidr_block         = cidrsubnets(var.vpc_cidr_block, 8, 8, 8, 8)
  public_subnet1_cidr_block  = local.subnets_cidr_block[0]
  public_subnet2_cidr_block  = local.subnets_cidr_block[1]
  private_subnet1_cidr_block = local.subnets_cidr_block[2]
  private_subnet2_cidr_block = local.subnets_cidr_block[3]
  az1_name                   = "${var.aws_region}a"
  az2_name                   = "${var.aws_region}b"
}