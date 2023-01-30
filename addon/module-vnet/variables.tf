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