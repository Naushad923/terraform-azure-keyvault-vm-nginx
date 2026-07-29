data "azurerm_network_interface" "nics" {
    for_each = var.vm_detail
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {
  for_each = var.vm_detail
  name                = each.value.keyvault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "pass" {
  for_each = var.vm_detail
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "user" {
  for_each = var.vm_detail
  name         = "vm-user"
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}