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

resource "azurerm_virtual_machine" "vm_red_hat" {
  name                              = var.vm_red_hat_name
  resource_group_name               = var.vm_red_hat_rg_name
  location                          = var.vm_red_hat_location
  vm_size                           = var.vm_red_hat_size

  network_interface_ids             = var.vm_red_hat_network_interface_ids

  storage_image_reference {
    id                              = data.azurerm_image.image.id
  }

  storage_os_disk {
    name                            = var.vm_red_hat_os_disk_name
    caching                         = var.vm_red_hat_os_disk_caching
    create_option                   = var.vm_red_hat_os_disk_create_option
    managed_disk_type               = var.vm_red_hat_os_disk_managed_disk_type
  }

  os_profile {
    computer_name                   = var.vm_red_hat_os_profile_computer_name
    admin_username                  = var.vm_red_hat_os_profile_admin_username
    admin_password                  = var.vm_red_hat_os_profile_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.vm_red_hat_os_profile_disable_password
  }

}