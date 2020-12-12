resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "private-route-table"
    env         = var.env
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_cidr_subnets)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}