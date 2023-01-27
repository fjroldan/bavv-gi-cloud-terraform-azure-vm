variable "vnet_name" {
    description = "Virtual_network name"
    type = string
}

variable "vnet_address_space" {
    description = "Virtual_network address space"
    type = list
}

variable "vnet_location" {
    description = "Virtual_network location"
    type = string
}

variable "vnet_resource_group_name" {
    description = "Virtual_network resource group name"
    type = string
}