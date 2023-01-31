// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ main.tf terraform module script                        -
// ------------------------------------------------------------
// Componente que define un modulo de terraform para crear 
// una ip publica en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
// 
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.public_ip_location
  resource_group_name = var.public_ip_resource_group_name
  allocation_method   = var.public_ip_allocation_method
}