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

variable "vm_red_hat_packer_resource_group_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_packer_image_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_rg_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_location" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_size" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_network_interface_ids" {
  description = "Red Hat virtual machine "
  type        = list
}

variable "vm_red_hat_os_disk_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_disk_caching" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_disk_create_option" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_disk_managed_disk_type" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_profile_computer_name" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_profile_admin_username" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_profile_admin_password" {
  description = "Red Hat virtual machine "
  type        = string
}

variable "vm_red_hat_os_profile_disable_password" {
  description = "Red Hat virtual machine "
  type        = bool
}