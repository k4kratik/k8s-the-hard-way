resource "aws_lb" "k8s_control_plane_lb" {
  name               = "k8s-control-plane-nlb"
  internal           = true
  load_balancer_type = "network"
  # security_groups    = [aws_security_group.k8s_control_plane_lb_sg.id]
  subnets = var.private_subnets.*.id

  tags = {
    Environment   = "K8s-The-Hard-Way"
    Component-For = "Control-Plane"
  }
}

resource "aws_lb_target_group" "k8s_masters_tg" {
  name        = "k8s-masters-tg"
  port        = 6443
  protocol    = "TCP"
  vpc_id      = var.vpc.id
  target_type = "ip"
}

resource "aws_lb_target_group_attachment" "k8s_masters_tg_attachment" {
  count = var.k8s-controllers-count

  target_group_arn = aws_lb_target_group.k8s_masters_tg.arn
  target_id        = aws_instance.k8s-controller-instance[count.index].private_ip
}

resource "aws_lb_listener" "k8s_listener_for_control-plane" {
  load_balancer_arn = aws_lb.k8s_control_plane_lb.arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.k8s_masters_tg.arn
  }
}

# LB 2 // Commenting for now, As I want something dynamic, Suppose if I have 10 apps, I dont want to create 10 Target Groups!!!

# resource "aws_lb" "k8s_public_lb" {
#   name               = "k8s-public-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.k8s_public_lb_sg.id]
#   subnets            = var.public_subnets.*.id

#   tags = {
#     Environment   = "K8s-The-Hard-Way"
#     Component-For = "Data-Plane"
#   }
# }

# resource "aws_lb_target_group" "k8s_public_tg" {
#   name        = "k8s-public-tg"
#   port        = 6443
#   protocol    = "HTTP"
#   vpc_id      = var.vpc.id
#   target_type = "ip"
# }

# resource "aws_lb_target_group_attachment" "k8s_public_tg_attachment" {
#   count = var.k8s-workers-count

#   target_group_arn = aws_lb_target_group.k8s_masters_tg.arn
#   target_id        = aws_instance.k8s-controller-instance[count.index].private_ip
# }

# resource "aws_lb_listener" "k8s_listener_for_control-plane" {
#   load_balancer_arn = aws_lb.k8s_control_plane_lb.arn
#   port              = "443"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.k8s_masters_tg.arn
#   }
# }
