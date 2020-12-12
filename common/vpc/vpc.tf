resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-${var.env}"
    env  = "prod"
  }
}
