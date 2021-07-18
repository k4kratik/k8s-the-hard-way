variable "az" {}

variable "vpc_id" {}

variable "bastion_ebs_size" {
  default = "8"
  type    = number
}

variable "worker_ebs_size" {
  default = "10"
  type    = number
}

variable "controller_ebs_size" {
  default = "8"
  type    = number
}

variable "k8s-controllers-count" {
  default = "3"
  type    = number
}

variable "k8s-workers-count" {
  default = "3"
  type    = number
}

# variable "account-id" {}
# Generating a pseudo variable, we will pass its value in root.tf in root module.

variable "instance_type" {
  default = "t2.micro"
}

variable "public_subnets" {
  type = list(any)
}

variable "private_subnets" {
  type = list(any)
}
