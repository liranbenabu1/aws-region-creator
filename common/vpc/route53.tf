resource "aws_route53_zone" "zone" {
  count       = var.addToRoute53 ? 1 : 0
  name        = var.route53_zone
}

resource "aws_route53_record" "setrecord" {
  count       = var.addToRoute53 ? 1 : 0
  zone_id     = aws_route53_zone.zone.0.zone_id
  name        = var.set_dns_name
  type        = "A"

  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}

