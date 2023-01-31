// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ variables.tf terraform module script                   -
// ------------------------------------------------------------
// Componente que define las variables asociadas a red virtual
// en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

variable "vnet_name" {
    description = "Virtual network name"
    type = string
}

variable "vnet_address_space" {
    description = "Virtual network address space"
    type = list
}

variable "vnet_location" {
    description = "Virtual network location"
    type = string
}

variable "vnet_resource_group_name" {
    description = "Virtual network resource group name"
    type = string
}