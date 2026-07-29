data "azurerm_public_ip" "pipd" {
    for_each = var.nat_gateway
  name                = each.value.ip_name
  resource_group_name = each.value.resource_group_name
}