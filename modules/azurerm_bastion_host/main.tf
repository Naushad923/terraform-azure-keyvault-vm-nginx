resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastion_detail
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name = each.value.config_name
    subnet_id = data.azurerm_subnet.sub[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}