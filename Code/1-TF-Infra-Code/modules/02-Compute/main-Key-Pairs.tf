# READING FROM LOCAL FILES
data "local_file" "bastion_pub_key_local" {
  filename = "${path.module}/key-pairs/k8s_bastion.pem.pub"
}

data "local_file" "controllers_pub_key_local" {
  filename = "${path.module}/key-pairs/k8s_controllers.pem.pub"
}

data "local_file" "workers_pub_key_local" {
  filename = "${path.module}/key-pairs/k8s_workers.pem.pub"
}

resource "aws_key_pair" "k8s_bastion_keypair" {
  key_name   = "k8s-bastion-key"
  public_key = data.local_file.bastion_pub_key_local.content
}

resource "aws_key_pair" "k8s_controllers_keypair" {
  key_name   = "k8s-controllers-key"
  public_key = data.local_file.controllers_pub_key_local.content
}

resource "aws_key_pair" "k8s_workers_keypair" {
  key_name   = "k8s-workers-key"
  public_key = data.local_file.workers_pub_key_local.content
}
