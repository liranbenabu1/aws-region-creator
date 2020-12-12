resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_cidr_subnets, count.index)
  availability_zone = element(var.public_zones, count.index % length(var.public_zones))

  tags = {
    Name = "${var.env}-${element(var.public_tiers, count.index)}"
    tier = element(var.public_tiers, count.index)
    env  = var.env
  }
  map_public_ip_on_launch = true
  count             = length(var.public_cidr_subnets)
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_cidr_subnets, count.index)
  availability_zone = element(var.private_zones, count.index % length(var.private_zones))

  tags = {
    Name = "${var.env}-${element(var.private_tiers, count.index)}"
    tier = element(var.private_tiers, count.index)
    env  = var.env
  }
  map_public_ip_on_launch = false
  count             = length(var.private_cidr_subnets)
}



