
resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm_detail
    name=each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = each.value.vm_size
  admin_username = data.azurerm_key_vault_secret.user[each.key].value
  admin_password = data.azurerm_key_vault_secret.pass[each.key].value
  network_interface_ids = [data.azurerm_network_interface.nics[each.key].id]
  disable_password_authentication=false

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

      custom_data = base64encode(<<EOF
apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF
    )               # from local machine 

#     connection {
#     type     = "ssh"
#     host     = data.azurerm_network_interface.nics[each.key].private_ip_address
#     user     = each.value.admin_username
#     password = each.value.admin_password
#   }

#   provisioner "remote-exec" {

#   inline = [
#     "sudo apt update",
#     "sudo apt install nginx -y",
#     "sudo systemctl start nginx"
#   ]
# }
}
