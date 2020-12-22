//us-east-1 vars

variable "cidr_vpc" {
  default = "10.228.0.0/16"
}

variable "public_subnets" {
  description = "A list of subnets ranges"
  type        = list

  default = ["10.228.0.0/26","10.228.0.64/26"]
}

variable "private_subnets" {
  description = "A list of subnets ranges"
  type        = list

  default = ["10.228.0.128/26","10.228.0.192/26"]
}

variable "public_zones" {
  description = "A list of allowed public zones"
  type        = list

  default = ["us-east-1a","us-east-1b"]
}

variable "private_zones" {
  description = "A list of allowed private zones"
  type        = list

  default = ["us-east-1c","us-east-1d"]
}


variable "public_tiers" {
  description = "public tiers names in list"
  type        = list

  default = ["public-1a","public-1b"]
}


variable "private_tiers" {
  description = "private tiers names in list"
  type        = list

  default = ["praivte-1c","praivte-1d"]
}

variable "buy_new_zone" {
  type    = bool
  default = false
}

variable "set_dns_name" {
  default = "test.bizzabo-devops.io"
}

variable "route53_zone" {
  default = "bizzabo-devops.io"
}
