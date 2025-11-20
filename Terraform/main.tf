# main.tf for the main folder, group 9

module "networking" {
  source                  = "./modules/networking"
  resource_group_name     = var.resource_group_name
  location                = var.location
  vnet_address_space      = ["10.0.0.0/16"]
  subnet_address_prefixes = ["10.0.1.0/24"]
  nsg_rules               = var.nsg_rules
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.networking.subnet_id
  nsg_id              = module.networking.nsg_id
}
