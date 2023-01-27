resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_resource_group_name

  security_rule {
    name                       = var.nsg_secr_name
    priority                   = var.nsg_secr_priority
    direction                  = var.nsg_secr_direction
    access                     = var.nsg_secr_access
    protocol                   = var.nsg_secr_protocol
    source_port_range          = var.nsg_secr_source_port_range
    destination_port_range     = var.nsg_secr_destination_port_range
    source_address_prefix      = var.nsg_secr_source_address_prefix
    destination_address_prefix = var.nsg_secr_destination_address_prefix
  }
}