//
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ main.tf terraform module script                        -
// ------------------------------------------------------------
// Componente principal del modelo de generaliazcion. Define 
// el modluo para implementacion de maquinas virtuales en 
// azure. 
// un grupo de segurida de red en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

module "vm_rg" {
  source      = "./addon/module-rg"
  for_each     = local.rg_pool
  rg_name     = each.value.name
  rg_location = each.value.location
}

module "vm_vnet" {
  source                   = "./addon/module-vnet"
  for_each                 = local.vnet_pool
  vnet_name                = each.value.name
  vnet_address_space       = each.value.address_space
  vnet_location            = each.value.location
  vnet_resource_group_name = each.value.resource_group_name

  depends_on = [
    module.vm_rg
  ]
}

module "vm_public_ip" {
  source                        = "./addon/module-public-ip"
  for_each                      = local.pi_pool
  public_ip_name                = each.value.name
  public_ip_location            = each.value.location
  public_ip_resource_group_name = each.value.resource_group_name 
  public_ip_allocation_method   = each.value.allocation_method

  depends_on = [
    module.vm_rg
  ]
}

module "vm_nsg" {
  source                              = "./addon/module-nsg"
  for_each                            = local.nsg_pool
  nsg_name                            = each.value.name
  nsg_location                        = each.value.location
  nsg_resource_group_name             = each.value.resource_group_name 
  nsg_secr_name                       = each.value.secr_name
  nsg_secr_priority                   = each.value.secr_priority
  nsg_secr_direction                  = each.value.secr_direction
  nsg_secr_access                     = each.value.secr_access
  nsg_secr_protocol                   = each.value.secr_protocol
  nsg_secr_source_port_range          = each.value.secr_source_port_range
  nsg_secr_destination_port_range     = each.value.secr_destination_port_range
  nsg_secr_source_address_prefix      = each.value.secr_source_address_prefix
  nsg_secr_destination_address_prefix = each.value.secr_destination_address_prefix
}

resource "azurerm_subnet" "subnet" {
  for_each             = local.sub_pool
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_interface" "neti" {
  for_each            = local.neti_pool
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = azurerm_subnet.subnet[each.value.subnet_name].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = module.vm_public_ip[each.value.public_ip_address_name].id
  }
}

resource "azurerm_network_interface_security_group_association" "association_nsg_neti" {
  for_each                  = local.nisg_pool
  network_interface_id      = azurerm_network_interface.neti[each.value.network_interface_name].id
  network_security_group_id = module.vm_nsg[each.value.network_security_group_name].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = local.vm_pool
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username

  network_interface_ids = [for name in each.value.network_interface_name_list : azurerm_network_interface.neti[name].id]

  admin_ssh_key {
    username   = each.value.ssh_username
    public_key = file(each.value.ssh_public_key_path)
  }

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}