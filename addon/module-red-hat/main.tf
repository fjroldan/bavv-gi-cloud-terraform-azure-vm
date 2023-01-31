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

resource "azurerm_virtual_machine_scale_set" "vm_red_hat" {
  name                = var.vm_red_hat_name
  location            = var.vm_red_hat_location
  resource_group_name = var.vm_red_hat_rg_name
  upgrade_policy_mode = var.vm_red_hat_upgrade_policy_mode

  sku {
    name     = var.vm_red_hat_sku_name
    tier     = var.vm_red_hat_sku_tier
    capacity = var.vm_red_hat_sku_capacity
  }

  storage_profile_image_reference {
    id = data.azurerm_image.image.id
  }

  os_profile {
    computer_name_prefix = var.vm_red_hat_os_computer_name_prefix
    admin_username       = var.vm_red_hat_os_admin_user
    admin_password       = var.vm_red_hat_os_admin_password
  }

  network_interface_ids = var.vm_red_hat_network_interface_ids

  admin_ssh_key {
    username   = var.vm_red_hat_ssh_username
    public_key = var.vm_red_hat_ssh_public_key
  }

  os_disk {
    caching              = var.vm_red_hat_os_disk_caching
    storage_account_type = var.vm_red_hat_os_disk_storage_account_type
  }
}