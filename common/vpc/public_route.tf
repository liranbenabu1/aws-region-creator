resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.create-site.id
  depends_on             = [aws_route_table.public]
}

resource "aws_route_table_association" "route-association" {
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
  count          = length(var.public_cidr_subnets)
}