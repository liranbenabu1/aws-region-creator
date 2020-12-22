module "vpc" {
  source                  = "../common/vpc"
  env                     = "prod"
  cidr_vpc                = var.cidr_vpc
  public_cidr_subnets     = var.public_subnets
  private_cidr_subnets    = var.private_subnets
  public_tiers            = ["public-1a","public-1b"]
  private_tiers           = ["praivte-1c","praivte-1d"]
  private_zones           = var.private_zones
  public_zones            = var.public_zones
  accessable-sg           = true
  addToRoute53            = true
  buy_new_zone            = true
  set_dns_name            = var.set_dns_name
  route53_zone            = var.route53_zone
}

