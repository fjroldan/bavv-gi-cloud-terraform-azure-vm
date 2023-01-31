// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ variables.tf terraform module script                   -
// ------------------------------------------------------------
// Componente que define las variables asociadas a la maquina 
// virtual de Red Hat azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

variable "nsg_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_packer_resource_group_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_packer_image_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_location" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_rg_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_upgrade_policy_mode" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_sku_name" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_sku_tier" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_sku_capacity" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_computer_name_prefix" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_admin_user" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_admin_password" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_network_interface_ids" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_username" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_public_key" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_os_disk_caching" {
    description = "Red Hat virtual machine "
    type = string
}

variable "vm_red_hat_os_disk_storage_account_type" {
    description = "Red Hat virtual machine "
    type = string
}