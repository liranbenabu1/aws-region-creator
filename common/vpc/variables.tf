// This file contains variables that hold for all envs

variable "env" {
  default = "dev"
}

variable "addToRoute53" {
  type    = bool
  default = true
}

variable "accessable-sg" {
  type    = bool
  default = true
}

variable "buy_new_zone" {
  type    = bool
  default = false
}

variable "cidr_vpc" {}

variable "public_cidr_subnets" {}

variable "private_cidr_subnets" {}

variable "public_zones" {}

variable "private_zones" {}

variable "public_tiers" {}

variable "private_tiers" {}

variable "set_dns_name" {}

variable "route53_zone" {}

variable ssh_key {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeiOBmfBy9kwZ9DXW+SuJsB6ADLprbCU92SvGGOlgIIAXtPBvydz00anR+hHCnPKQCu299oydS+EXrLh0+DuN++sjfGkBUZgSJsK+HClTvKmlHMt2k0zYFq/GI4KLtEAue6vW+8tjzmMQMc4MVma5wDZc9VZ2jg0pDxBxwEEu7xFl91L7tujjVSvIo/aL5jZvOlcdfsJR+0xqcAWd8Q6mQnryqOI5B+IjMiZZ7+AwPR8vd1shPiAw/czH/bXX+TNeP3GrkfWok2ELxS6RC++IzpoXvvqlDHUn9KfgWcbABzF2PdoSBS9rQ741fHM1/W+TbiXfQ8fLtmIMMBc3edGVP liran@localhost.localdomain"
}