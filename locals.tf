//
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ locals.tf terraform module script                      -
// ------------------------------------------------------------
// Componente que define el mapeo de las variables de entrada
// al modelo de generalizacion de infrastructura
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

locals {
  rg_pool = { for x in var.resource_group_pool: x.name => x }
  vnet_pool = { for x in var.virtual_network_pool: x.name => x }
  pi_pool = { for x in var.public_ip_pool: x.name => x }
  nsg_pool = { for x in var.network_security_group_pool: x.name => x }
  sub_pool = { for x in var.subnet_pool: x.name => x }
  neti_pool = { for x in var.network_interface_pool: x.name => x }
  nisg_pool = { for x in var.network_interface_security_group_association_pool: x.name => x }
  vm_pool = { for x in var.virtual_machine_pool: x.name => x }
}