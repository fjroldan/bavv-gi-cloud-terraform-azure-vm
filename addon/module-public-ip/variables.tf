// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ variables.tf terraform module script                   -
// ------------------------------------------------------------
// Componente que define las variables asociadas ip publica
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

variable "public_ip_name" {
  description = "Public ip name"
  type        = string
}

variable "public_ip_location" {
  description = "Public ip location"
  type        = string
}

variable "public_ip_resource_group_name" {
  description = "Public ip resource group name"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Public ip allocation method"
  type        = string
}