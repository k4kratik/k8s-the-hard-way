output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "elastic-ip-addr" {
  value = aws_eip.elastic-ip.public_ip
}

output "IGW-id" {
  value = aws_internet_gateway.igw.id
}


output "NGW-id" {
  value = aws_nat_gateway.nat-gw.id
}
