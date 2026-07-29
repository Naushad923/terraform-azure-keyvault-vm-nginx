data "azurerm_subnet" "sub" {
    for_each = var.bastion_detail
  name                 = each.value.sub_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
    for_each = var.bastion_detail
  name                = each.value.ip_name
  resource_group_name =each.value.resource_group_name
}
