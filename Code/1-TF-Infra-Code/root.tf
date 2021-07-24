module "networking" {
  source = "./modules/01-Networking"
  az_1   = data.aws_availability_zones.available_az.names[0]
  az_2   = data.aws_availability_zones.available_az.names[1]
  az_3   = data.aws_availability_zones.available_az.names[2]
}

module "compute" {
  source = "./modules/02-Compute"

  az = data.aws_availability_zones.available_az.names

  vpc = module.networking.vpc

  public_subnets  = module.networking.public_subnets
  private_subnets = module.networking.private_subnets
}
