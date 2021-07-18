output "bastion_instance_public_ip" {
  value = aws_instance.k8s-bastion-instance[0].public_ip
}
