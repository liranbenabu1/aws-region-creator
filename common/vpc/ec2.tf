data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.devops.key_name
  count = length(var.private_cidr_subnets)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  security_groups = [aws_security_group.internal_access.id]
  tags = {
    Name = "web-${var.env}"
  }
}