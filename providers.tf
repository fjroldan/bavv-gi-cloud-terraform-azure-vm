//
// ------------------------------------------------------------
// - Todos los derechos reservados 2023                       -
// - Banco AV Villas                                          -
// - $ main.tf terraform module script                        -
// ------------------------------------------------------------
// Componente que define el mecanismo de autenticacion y 
// acceso a recursos
// @autor Equipo IaC - Vass Latam
// @version 0.0.1.0
// @date 31/01/23
//

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "bcb520ca-0fe0-4eaa-9afc-da74b5c01bd7"
  client_id       = "aeeafcad-0b41-4f28-8c72-129641a4d94b"
  client_secret   = "oIw8Q~oEc13kxK0aJ8OUMs~cd2~OjktsDwWxKcxd"
  tenant_id       = "1acfa458-2c17-44e5-b9d8-ff851b6c7c5f"
}