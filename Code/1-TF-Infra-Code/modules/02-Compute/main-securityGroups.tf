# security group for K8s Bastion Instance
resource "aws_security_group" "k8s_bastion_SG" {

  vpc_id = var.vpc_id
  name   = "k8s_bastion_SG"


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

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

  vpc_id = var.vpc_id
  name   = "k8s_worker_SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s_controller_SG"
  }
}

# security group for K8s Worker Instances
resource "aws_security_group" "k8s_worker_SG" {

  vpc_id = var.vpc_id
  name   = "k8s_controller_SG"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s_worker_SG"
  }
}

