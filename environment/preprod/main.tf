module "resource_group" {
  source    = "../../modules/azurerm_resource_group"
  rg_detail = var.rg_details
}
module "virtual_network" {
  depends_on  = [module.resource_group]
  source      = "../../modules/azurerm_virtual_network"
  vnet_detail = var.vnet_details
}
module "subnet" {
  depends_on    = [module.virtual_network]
  source        = "../../modules/azurerm_subnet"
  subnet_detail = var.subnet_details
}
module "public_ip" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_public_ip"
  public_ip_detail = var.public_ip_details
}
module "nic-card" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../modules/azurerm_network_interface"
  nic_detail = var.nic_details
}
module "virtual_machine" {
  depends_on = [module.nic-card, module.public_ip,module.key_vault]
  source     = "../../modules/azurerm_virtual_machine"
  vm_detail  = var.vm_details
}
 module "bastion_host" {
   depends_on     = [module.subnet, module.public_ip]
   source         = "../../modules/azurerm_bastion_host"
   bastion_detail = var.bastion_details

 }

 module "nat_gateway" {
   depends_on  = [module.public_ip]
   source      = "../../modules/azurerm_nat_gateway"
   nat_gateway = var.nat_gateways
 }

 module "nsg" {
   depends_on = [module.subnet]
   source     = "../../modules/azurerm_network_security_group"
   nsg_detail = var.nsg_details

 }

module "key_vault" {
  depends_on = [ module.resource_group]
  source = "../../modules/azurerm_key_vault"
  key-vault-detail=var.key-vault-details
  
}
