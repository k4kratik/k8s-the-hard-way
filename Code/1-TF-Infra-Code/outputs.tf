output "account_id" {
  value = data.aws_caller_identity.current_account_info.account_id

}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "elastic-ip-addr" {
  value = module.networking.elastic-ip-addr
}

output "IGW-id" {
  value = module.networking.IGW-id
}


output "NGW-id" {
  value = module.networking.NGW-id
}
