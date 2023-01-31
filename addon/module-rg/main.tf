// 
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ main.tf terraform module script                        -
// ------------------------------------------------------------
// Componente que define un modulo de terraform para crear 
// un grupo de recursos en azure
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
// 
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}