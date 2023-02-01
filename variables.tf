variable "resource_group_pool" {
  description = "Virtual machine resource group"
  type = list(object({
    name     = string
    location = string
  }))
}

variable "virtual_network_pool" {
  description = "Virtual machine virtual network"
  type = list(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
}

variable "public_ip_pool" {
  description = "Virtual machine public ip"
  type = list(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "network_security_group_pool" {
  description = "Virtual machine network security group"
  type = list(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    secr_name                       = string
    secr_priority                   = string
    secr_direction                  = string
    secr_access                     = string
    secr_protocol                   = string
    secr_source_port_range          = string
    secr_destination_port_range     = string
    secr_source_address_prefix      = string
    secr_destination_address_prefix = string
  }))
}

variable "subnet_pool" {
  description = "Virtual machine subnet"
  type = list(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_interface_pool" {
  description = "Virtual machine network interface"
  type = list(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    ip_name                       = string
    subnet_name                   = string
    private_ip_address_allocation = string
    public_ip_address_name        = string
  }))
}

variable "network_interface_security_group_association_pool" {
  description = "Virtual machine network interface security group association"
  type = list(object({
    name                        = string
    network_interface_name      = string
    network_security_group_name = string
  }))
}

variable "virtual_machine_pool" {
  description = "Virtual machine"
  type = list(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    size                         = string
    admin_username               = string

    network_interface_name_list  = list(string)

    ssh_username                 = string
    ssh_public_key_path          = string

    os_disk_caching              = string
    os_disk_storage_account_type = string

    image_publisher              = string
    image_offer                  = string
    image_sku                    = string
    image_version                = string
  }))
}

variable "red_hat_virtual_machine_pool" {
  description = "Red hat virtual machine"
  type = list(object({

    packer_resource_group_name   = string
    packer_image_name            = string
    name                         = string
    resource_group_name          = string
    location                     = string
    size                         = string
    network_interface_name_list  = list(string)

    os_disk_name                 = string
    os_disk_caching              = string
    os_disk_create_option        = string
    os_disk_managed_disk_type    = string
    os_profile_computer_name     = string
    os_profile_admin_username    = string
    os_profile_admin_password    = string
    os_profile_disable_password  = bool
  }))
}