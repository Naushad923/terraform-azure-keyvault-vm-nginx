resource "azurerm_network_interface" "network-int" {
    for_each = var.nic_detail
  name = each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name = each.value.ip_config_name
    subnet_id = data.azurerm_subnet.sub[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    #public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }
}