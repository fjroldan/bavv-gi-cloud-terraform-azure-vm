// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ variables.tf terraform module script                   -
// ------------------------------------------------------------
// Componente que define las variables asociadas a  un grupo 
// de segurida de red en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

variable "nsg_name" {
    description = "Network security group name"
    type = string
}

variable "nsg_location" {
    description = "Network security group location"
    type = string
}

variable "nsg_resource_group_name" {
    description = "Network security group resource group name"
    type = string
}

variable "nsg_secr_name" {
    description = "Network security group security rule name"
    type = string
}

variable "nsg_secr_priority" {
    description = "Network security group security rule priority"
    type = string
}

variable "nsg_secr_direction" {
    description = "Network security group security rule direction"
    type = string
}

variable "nsg_secr_access" {
    description = "Network security group security rule access"
    type = string
}

variable "nsg_secr_protocol" {
    description = "Network security group security rule protocol"
    type = string
}

variable "nsg_secr_source_port_range" {
    description = "Network security group security rule source port range"
    type = string
}

variable "nsg_secr_destination_port_range" {
    description = "Network security group security rule destination port range"
    type = string
}

variable "nsg_secr_source_address_prefix" {
    description = "Network security group security rule source address prefix"
    type = string
}

variable "nsg_secr_destination_address_prefix" {
    description = "Network security group security rule destination address prefix"
    type = string
}