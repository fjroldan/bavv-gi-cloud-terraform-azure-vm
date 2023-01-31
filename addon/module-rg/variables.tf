// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ variables.tf terraform module script                   -
// ------------------------------------------------------------
// Componente que define las variables asociadas a un grupo 
// de recursos en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "rg_location" {
  description = "Resource group location"
  type        = string
}