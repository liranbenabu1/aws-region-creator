resource "aws_security_group" "world_access" {
  vpc_id      = aws_vpc.vpc.id
  name        = "access_from_the_world"
  description = "security group that managing access from the world"
  count       = var.accessable-sg ? 1 : 0

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    description = "Outbound to all"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "access_from_the_world"
    env = var.env
  }
}


resource "aws_security_group" "internal_access" {
  vpc_id      = aws_vpc.vpc.id
  name        = "internal"
  description = "sg allowing comunication between instances that member in this sg internal the vpc."

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    description = "Outbound to all"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "internal"
    env = var.env
  }
}