rg_details = {
  rg1 = {
    name     = "alam-rg"
    location = "central India"
  }
}
vnet_details = {
  vnet1 = {
    name                = "alam-vnet"
    location            = "central India"
    resource_group_name = "alam-rg"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet_details = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "alam-rg"
    virtual_network_name = "alam-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "alam-rg"
    virtual_network_name = "alam-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "alam-rg"
    virtual_network_name = "alam-vnet"
    address_prefixes     = ["10.0.3.0/26"]
  }

}

public_ip_details = {

  ip1 = {
    name                = "pip1"
    location            = "central India"
    resource_group_name = "alam-rg"
    allocation_method   = "Static"
  }
  ip2 = {
    name                = "pip2"
    location            = "central India"
    resource_group_name = "alam-rg"
    allocation_method   = "Static"
  }
}

nic_details = {
  nic1 = {
    nic_name                      = "nic-1"
    location                      = "Central India"
    resource_group_name           = "alam-rg"
    ip_config_name                = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "backend-subnet"
    virtual_network_name          = "alam-vnet"
    pip_name                      = "pip1"

  }
  nic2 = {
    nic_name                      = "nic-2"
    location                      = "Central India"
    resource_group_name           = "alam-rg"
    ip_config_name                = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "backend-subnet"
    virtual_network_name          = "alam-vnet"
    pip_name                      = "pip2"

  }
}

vm_details = {
  vm1 = { vm_name = "vm1-linux"
    resource_group_name = "alam-rg"
    location            = "Central India"
    vm_size             = "Standard_D2s_v3"
    nic_name      = "nic-1"
    keyvault_name = "nau-keyvaulttest"

  }
  vm2 = { vm_name = "vm2-linux"
    resource_group_name = "alam-rg"
    location            = "Central India"
    vm_size             = "Standard_D2s_v3"
    nic_name      = "nic-2"
    keyvault_name = "nau-keyvaulttest"

  }
}
bastion_details = {
  bastion = {
    name                 = "nau-bastion"
    location             = "Central India"
    resource_group_name  = "alam-rg"
    config_name          = "configuration"
    sub_name             = "AzureBastionSubnet"
    ip_name              = "pip1"
    virtual_network_name = "alam-vnet"
  }
}

nat_gateways = {
  nat1 = {
    name                = "nat-gateway-nau"
    location            = "Central India"
    resource_group_name = "alam-rg"
    sku_name            = "Standard"
    ip_name             = "pip2"
  }
}

nsg_details = {
  nsg1 = {
    name                       = "nau-nsg"
    location                   = "Central India"
    resource_group_name        = "alam-rg"
    rule_name                  = "test1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    sub_name                   = "backend-subnet"
    virtual_network_name       = "alam-vnet"
  }
}
key-vault-details={
  key_vault1={
      name="nau-keyvaulttest"
      location="Central India"
      resource_group_name="alam-rg"
      rbac_authorization_enabled=true
      sku_name="premium"
      soft_delete_retention_days=7
      role_definition_name="Key Vault Administrator"
    
  }
}









