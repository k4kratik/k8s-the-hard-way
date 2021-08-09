# security group for K8s Bastion Instance
resource "aws_security_group" "k8s_bastion_SG" {

  vpc_id = var.vpc.id
  name   = "k8s_bastion_SG"


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Public SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    // This means, all ip address are allowed to ssh !
    // Do not do it in the production. Put your office or home address in it!
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s_bastion_SG"
  }
}


# security group for K8s Controller Instances
resource "aws_security_group" "k8s_controller_SG" {

  vpc_id = var.vpc.id
  name   = "k8s_controller_SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH From Bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    // This means, all ip address are allowed to ssh !
    // Do not do it in the production. Put your office or home address in it!
    cidr_blocks = ["${aws_instance.k8s-bastion-instance[0].private_ip}/32"]
  }

  ingress {
    description = "Allow ETCD connection between k8s controllers"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = var.private_subnets[*].cidr_block
  }

  ingress {
    description = "K8s API Server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = var.private_subnets[*].cidr_block
  }

  tags = {
    Name = "k8s_controller_SG"
  }
}

# security group for K8s Worker Instances
resource "aws_security_group" "k8s_worker_SG" {

  vpc_id = var.vpc.id
  name   = "k8s_worker_SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH From Bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    // This means, all ip address are allowed to ssh !
    // Do not do it in the production. Put your office or home address in it!
    cidr_blocks = ["${aws_instance.k8s-bastion-instance[0].private_ip}/32"]
  }
  tags = {
    Name = "k8s_worker_SG"
  }
}

# SG for Public ALB


resource "aws_security_group" "k8s_public_lb_sg" {

  vpc_id = var.vpc.id
  name   = "k8s_public_lb_sg"


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Access for some App"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s_public_lb_sg"
  }
}
