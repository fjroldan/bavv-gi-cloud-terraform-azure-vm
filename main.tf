resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.vm_resource_group_name
  virtual_network_name = var.subnet_virtual_network_name
  address_prefixes     = var.subnet_address_prefixes  
}

resource "azurerm_network_interface" "neti" {
  name                = var.neti_name
  location            = var.vm_location
  resource_group_name = var.vm_resource_group_name

  ip_configuration {
    name                          = var.neti_private_ip_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.neti_private_ip_address_allocation
    public_ip_address_id          = var.neti_public_ip_address_id
  }

  depends_on = [
    azurerm_subnet.subnet
  ]
}

resource "azurerm_network_interface_security_group_association" "association_nsg_neti" {
  network_interface_id      = azurerm_network_interface.neti.id
  network_security_group_id = var.association_nsg_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.vm_resource_group_name
  location            = var.vm_location
  size                = var.vm_size
  admin_username      = var.vm_admin_username

  network_interface_ids = [
    azurerm_network_interface.neti.id,
  ]

  admin_ssh_key {
    username   = var.vm_ssh_username
    public_key = var.vm_public_key
  }

  os_disk {
    caching              = var.vm_caching
    storage_account_type = var.vm_storage_account_type
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  depends_on = [
    azurerm_network_interface.neti
  ]
}