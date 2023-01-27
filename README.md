# bavv-gi-cloud-terraform-azure-vm

#
terraform fmt -recursive

#
Error: Failed to query available provider packages
│ 
│ Could not retrieve the list of available versions for provider hashicorp/azurerm: locked provider registry.terraform.io/hashicorp/azurerm 3.41.0 does not match configured
│ version constraint ~> 2.0; must use terraform init -upgrade to allow selection of new versions

terraform init -upgrade








module "vm_rg" {
  source      = "../bavv-gi-cloud-terraform-azure-vm/addon/module-rg"
  rg_name     = "vm-test-rg"
  rg_location = "West Europe"
}

module "vm_vnet" {
  source                   = "../bavv-gi-cloud-terraform-azure-vm/addon/module-vnet"
  vnet_name                = "vm-test-vnet"
  vnet_address_space       = ["10.0.0.0/16"]
  vnet_location            = "West Europe"
  vnet_resource_group_name = module.vm_rg.rg_name

  depends_on = [
    module.vm_rg
  ]
}

module "vm_public_ip" {
  source                        = "../bavv-gi-cloud-terraform-azure-vm/addon/module-public-ip"
  public_ip_name                = "vm-test-public_ip"
  public_ip_location            = "West Europe"
  public_ip_resource_group_name = module.vm_rg.rg_name
  public_ip_allocation_method   = "Dynamic"

  depends_on = [
    module.vm_rg
  ]
}

module "vm_nsg" {
  source                              = "../bavv-gi-cloud-terraform-azure-vm/addon/module-nsg"
  nsg_name                            = "vm-test-nsg"
  nsg_location                        = "West Europe"
  nsg_resource_group_name             = module.vm_rg.rg_name
  nsg_secr_name                       = "SSH"
  nsg_secr_priority                   = 1001
  nsg_secr_direction                  = "Inbound"
  nsg_secr_access                     = "Allow"
  nsg_secr_protocol                   = "Tcp"
  nsg_secr_source_port_range          = "*"
  nsg_secr_destination_port_range     = "22"
  nsg_secr_source_address_prefix      = "*"
  nsg_secr_destination_address_prefix = "*"

  depends_on = [
    module.vm_rg
  ]
}

module "vm" {
  source = "../bavv-gi-cloud-terraform-azure-vm"

  subnet_name                        = "vm-test-subnet"
  subnet_virtual_network_name        = module.vm_vnet.vnet_name
  subnet_address_prefixes            = ["10.0.2.0/24"]

  neti_name                          = "vm-test-neti"
  neti_private_ip_name               = "vm-test-neti-pi"
  neti_private_ip_address_allocation = "Dynamic"
  neti_public_ip_address_id          = module.vm_public_ip.id

  vm_resource_group_name             = module.vm_rg.rg_name
  vm_location                        = "West Europe"
  vm_name                            = "vm-test"
  vm_size                            = "Standard_F2"
  vm_admin_username                  = "adminuser"

  vm_ssh_username                    = "adminuser"
  vm_public_key                      = file("~/.ssh/azure_rsa.pub")

  vm_caching                         = "ReadWrite"
  vm_storage_account_type            = "Standard_LRS"

  vm_publisher                       = "Canonical"
  vm_offer                           = "UbuntuServer"
  vm_sku                             = "16.04-LTS"
  vm_version                         = "latest"

  association_nsg_id                 =  module.vm_nsg.id

  depends_on = [
    module.vm_public_ip
  ]
}