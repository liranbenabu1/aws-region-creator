

resource "aws_route53_zone" "zone" {
  count       = var.addToRoute53 ? 1 : 0
  name        = var.route53_zone
}

resource "aws_route53_zone_association" "route53_association" {
  zone_id     = aws_route53_zone.zone.0.zone_id
  vpc_id      = aws_vpc.vpc.id
  count       = var.addToRoute53 ? 1 : 0
 }

resource "aws_route53_record" "setrecord" {
  count       = var.addToRoute53 ? 1 : 0
  zone_id     = aws_route53_zone.zone.0.zone_id
  name        = var.set_dns_name
  type        = "A"

  alias {
    name                   = aws_elb.elb.dns_name
    zone_id                = aws_elb.elb.zone_id
    evaluate_target_health = true
  }
}

