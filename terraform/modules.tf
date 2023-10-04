module "network" {
  source = "./modules/network"
}

module "nagios" {
  source = "./modules/compute"

  instance_name              = "nagios"
  instance_ami_id            = "ami-0bb4c991fa89d4b9b"
  instance_subnet_id         = module.network.vpc_subnet_id
  instance_security_group_id = module.network.vpc_security_group_id
  instance_user_data         = var.nagios_user_data
}

module "node_a" {
  source = "./modules/compute"

  instance_name              = "node_a"
  instance_ami_id            = "ami-0bb4c991fa89d4b9b"
  instance_subnet_id         = module.network.vpc_subnet_id
  instance_security_group_id = module.network.vpc_security_group_id
  instance_user_data         = var.node_a_user_data
}