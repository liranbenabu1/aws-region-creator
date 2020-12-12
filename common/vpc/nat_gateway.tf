resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.create-site]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.private_subnet.0.id
  depends_on    = [aws_internet_gateway.create-site]
  tags = {
    Name        = "private-subnets-nat"
    env         = var.env
  }
}