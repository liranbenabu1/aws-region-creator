resource "aws_elb" "elb" {
  name               = "elb-prod"
  availability_zones = var.private_zones
  security_groups = [ aws_security_group.world_access.0.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  listener {
  instance_port      = 443
  instance_protocol  = "https"
  lb_port            = 8080
  lb_protocol        = "http"
  }

  health_check {
  healthy_threshold   = 2
  unhealthy_threshold = 2
  timeout             = 3
  target              = "HTTP:8000/"
  interval            = 30
  }
    tags = {
    Name = "${var.env}-elb"
    env  = var.env
  }
}
