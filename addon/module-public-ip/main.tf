resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.public_ip_location
  resource_group_name = var.public_ip_resource_group_name
  allocation_method   = var.public_ip_allocation_method
}