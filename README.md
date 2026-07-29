# Terraform Azure Key Vault VM NGINX

This project demonstrates how to deploy a secure Azure Virtual Machine using **Terraform Modules** by integrating **Azure Key Vault** for secret management.

## Features

- Create Azure Resource Group
- Create Virtual Network and Subnets
- Create Public IP
- Create Network Interface
- Create Azure Key Vault
- Assign Azure RBAC permissions to Key Vault
- Generate a random VM password automatically
- Store VM username and password securely in Azure Key Vault
- Retrieve secrets from Key Vault during VM deployment
- Create Ubuntu Linux Virtual Machine
- Install NGINX automatically using Cloud-Init
- Complete infrastructure deployment with a single `terraform apply`

---

## Architecture

```
Terraform
    │
    ▼
Resource Group
    │
    ├── Virtual Network
    │      └── Subnet
    │
    ├── Public IP
    │
    ├── Network Interface
    │
    ├── Azure Key Vault
    │      ├── Generate Random Password
    │      ├── Store VM Username
    │      └── Store VM Password
    │
    └── Linux Virtual Machine
           ├── Read Username from Key Vault
           ├── Read Password from Key Vault
           └── Install NGINX using Cloud-Init
```

---

## Project Structure

```
terraform-azure-keyvault-vm-nginx
│
├── environment
│   └── preprod
│       ├── main.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variable.tf
│
├── modules
│   ├── azurerm_resource_group
│   ├── azurerm_virtual_network
│   ├── azurerm_subnet
│   ├── azurerm_public_ip
│   ├── azurerm_network_interface
│   ├── azurerm_key_vault
│   └── azurerm_virtual_machine
│
└── README.md
```

---

## Deployment

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Review execution plan

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply -auto-approve
```

Destroy infrastructure

```bash
terraform destroy -auto-approve
```

---

## Security

- VM credentials are **never hardcoded**.
- Password is generated automatically using the **Terraform Random Provider**.
- Credentials are stored securely in **Azure Key Vault**.
- VM reads the username and password directly from Key Vault.
- Azure RBAC is used for secure access to Key Vault secrets.

---

## Technologies Used

- Terraform
- Microsoft Azure
- Azure Key Vault
- Azure RBAC
- Azure Virtual Machine
- Azure Virtual Network
- Azure Public IP
- Azure Network Interface
- Cloud-Init
- NGINX

---

## Workflow

1. Create Azure Key Vault.
2. Assign RBAC permissions.
3. Generate a random password.
4. Store VM username and password in Key Vault.
5. Read secrets from Key Vault.
6. Deploy Ubuntu Linux VM.
7. Install NGINX automatically using Cloud-Init.
8. Infrastructure is deployed with a single Terraform command.

- Cloud-Init Automation
- Secure Infrastructure Deployment
- Infrastructure as Code (IaC)
