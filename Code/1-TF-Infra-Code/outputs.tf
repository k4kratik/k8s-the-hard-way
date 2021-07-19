output "account_id" {
  value = data.aws_caller_identity.current_account_info.account_id

}

#  networking
output "NETWORK-vpc_id" {
  value = module.networking.vpc_id
}

output "NETWORK-elastic-ip-addr" {
  value = module.networking.elastic-ip-addr
}

output "NETWORK-IGW-id" {
  value = module.networking.IGW-id
}


output "NETWORK-NGW-id" {
  value = module.networking.NGW-id
}


# compute

output "EC2-bastion_instance_public_ip" {
  value = module.compute.bastion_instance_public_ip
}

output "EC2-controller_instances_ids_and_ips" {
  value = [module.compute.controller_instances_ids, module.compute.controller_instances_private_ips]
}

output "EC2-worker_instances_ids_and_ips" {
  value = [module.compute.worker_instances_ids, module.compute.worker_instances_private_ips]
}
output "EC2-bastion_instances_id_and_ip" {
  value = [module.compute.bastion_instances_id, module.compute.bastion_instance_private_ip]
}

