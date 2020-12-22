resource "aws_eip" "eip_nlb0" {
  tags    = {
    Name  = "first-elb-prod"
    env   = var.env
  }
}

resource "aws_eip" "eip_nlb1" {
  tags    = {
    Name  = "first-elb-prod"
    env   = var.env
  }
}

resource "aws_lb" "load_balancer" {
  name                              = "elb-prod"
  load_balancer_type                = "network"
  subnet_mapping {
    subnet_id = aws_subnet.private_subnet.0.id
    allocation_id = aws_eip.eip_nlb0.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.private_subnet.1.id
    allocation_id = aws_eip.eip_nlb1.id
  }
  tags = {
    env  = var.env
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn       = aws_lb.load_balancer.arn
  for_each = var.listner_ports
      port                = each.key
      protocol            = each.value
      default_action {
        target_group_arn  = aws_lb_target_group.tg[each.key].arn
        type              = "forward"
      }
}

resource "aws_lb_target_group" "tg" {
  for_each = var.listner_ports
    name                  = "${var.env}-tg-${each.key}"
    port                  = each.key
    protocol              = each.value
  vpc_id                  = aws_vpc.vpc.id
  target_type             = "instance"
  deregistration_delay    = 90
health_check {
    interval            = 30
    port                = 8080
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
  tags = {
     env  = var.env
  }
}

resource "aws_lb_target_group_attachment" "tga1" {
  for_each = var.listner_ports
    target_group_arn  = aws_lb_target_group.tg[each.key].arn
    port              = each.key
  target_id           = aws_instance.web.0.id
}

resource "aws_lb_target_group_attachment" "tga2" {
  for_each = var.listner_ports
    target_group_arn  = aws_lb_target_group.tg[each.key].arn
    port              = each.key
  target_id           = aws_instance.web.1.id
}