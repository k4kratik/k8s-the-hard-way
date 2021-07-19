output "bastion_instance_public_ip" {
  value = aws_instance.k8s-bastion-instance[0].public_ip
}

output "bastion_instance_private_ip" {
  value = aws_instance.k8s-bastion-instance[0].private_ip
}

output "controller_instances_ids" {
  value = aws_instance.k8s-controller-instance.*.id
}

output "worker_instances_ids" {
  value = aws_instance.k8s-worker-instance.*.id
}

output "bastion_instances_id" {
  value = aws_instance.k8s-bastion-instance.*.id
}

output "controller_instances_private_ips" {
  value = aws_instance.k8s-controller-instance.*.private_ip
}

output "worker_instances_private_ips" {
  value = aws_instance.k8s-worker-instance.*.private_ip
}
