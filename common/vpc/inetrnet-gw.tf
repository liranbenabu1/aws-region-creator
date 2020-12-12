// The Internet Gateway is like the public router for your VPC. It provides
// internet to-from resources inside the VPC.
resource "aws_internet_gateway" "create-site" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet gw"
    env  = var.env
  }
}
