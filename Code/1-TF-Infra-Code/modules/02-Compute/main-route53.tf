resource "aws_route53_zone" "k8s_private_hosted_zone" {
  name = "kratik.com"

  vpc {
    vpc_id = var.vpc.id
  }
}

resource "aws_route53_record" "k8s_controller_lb_record" {
  zone_id = aws_route53_zone.k8s_private_hosted_zone.zone_id
  name    = "k8s-controller-load-balancer.kratik.com"
  type    = "CNAME"
  ttl     = "300"
  #   records = [aws_lb.k8s_control_plane_lb.dns_name]
  records = ["K8s-test-5e81546dd5da2e12.elb.us-east-1.amazonaws.com"]
}
