//
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ main.tf terraform module script                        -
// ------------------------------------------------------------
// Componente que define un modulo de terraform para crear 
// una maquina virtual con so Red Hat en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

data "azurerm_resource_group" "image" {
  name = var.vm_red_hat_packer_resource_group_name
}

data "azurerm_image" "image" {
  name                = var.vm_red_hat_packer_image_name
  resource_group_name = data.azurerm_resource_group.image.name
}

resource "azurerm_linux_virtual_machine" "vm_red_hat" {
  name                = var.vm_red_hat_name
  resource_group_name = var.vm_red_hat_rg_name
  location            = var.vm_red_hat_location
  size                = var.vm_red_hat_size
  admin_username      = var.vm_red_hat_admin_username

  network_interface_ids = var.vm_red_hat_network_interface_ids

  admin_ssh_key {
    username   = var.vm_red_hat_ssh_username
    public_key = var.vm_red_hat_ssh_public_key
  }

  os_disk {
    caching              = var.vm_red_hat_os_disk_caching
    storage_account_type = var.vm_red_hat_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

}