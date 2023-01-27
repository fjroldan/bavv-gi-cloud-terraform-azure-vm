variable "vm_resource_group_name" {
    description = "Virtual machine resource group name"
    type = string
}

variable "vm_location" {
    description = "Virtual machine location"
    type = string
}

variable "vm_name" {
    description = "Virtual machine name"
    type = string
}

variable "vm_size" {
    description = "Virtual machine size"
    type = string
}

variable "vm_admin_username" {
    description = "Virtual machine admin username"
    type = string
}

variable "vm_ssh_username" {
    description = "Virtual machine user name"
    type = string
}

variable "vm_public_key" {
    description = "Virtual machine public key"
    type = string
}

variable "vm_caching" {
    description = "Virtual machine os disk caching"
    type = string
}

variable "vm_storage_account_type" {
    description = "Virtual machine os disk storage account type"
    type = string
}

variable "vm_publisher" {
    description = "Virtual machine source image reference publisher"
    type = string
}

variable "vm_offer" {
    description = "Virtual machine source image reference offer"
    type = string
}

variable "vm_sku" {
    description = "Virtual machine source image reference sku"
    type = string
}

variable "vm_version" {
    description = "Virtual machine source image reference version"
    type = string
}

variable "subnet_name" {
    description = "Subnet name"
    type = string
}

variable "subnet_virtual_network_name" {
    description = "Subnet virtual_network_name"
    type = string
}

variable "subnet_address_prefixes" {
    description = "Subnet address_prefixes"
    type = list
}

variable "neti_name" {
    description = "Network interface name"
    type = string
}

variable "neti_private_ip_name" {
    description = "Network interface private ip name"
    type = string
}

variable "neti_private_ip_address_allocation" {
    description = "Network interface ip address allocation"
    type = string
}

variable "neti_public_ip_address_id" {
    description = "Network interface public ip address id"
    type = string
}

variable "association_nsg_id" {
    description = "Association network interface public for nsg"
    type = string
}