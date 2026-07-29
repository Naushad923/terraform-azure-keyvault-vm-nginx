
resource "azurerm_key_vault" "key_vault" {
    for_each = var.key-vault-detail
  name                       = each.value.name
  location                   =  each.value.location
  resource_group_name        = each.value.resource_group_name
  rbac_authorization_enabled = each.value.rbac_authorization_enabled
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days

}

resource "azurerm_role_assignment" "kv_admin" {
  for_each = var.key-vault-detail

  scope                = azurerm_key_vault.key_vault[each.key].id
  role_definition_name = each.value.role_definition_name
  principal_id         = data.azurerm_client_config.current.object_id
}



resource "random_password" "vm_password" {
  length           = 8
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "vm_password" {
  for_each = var.key-vault-detail
  name         = "vm-password"
  value        = random_password.vm_password.result
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
    depends_on = [azurerm_role_assignment.kv_admin]
}

resource "azurerm_key_vault_secret" "vm_username" {
  for_each = var.key-vault-detail
  name         = "vm-user"
  value        = "alam91"
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
    depends_on = [azurerm_role_assignment.kv_admin]
}