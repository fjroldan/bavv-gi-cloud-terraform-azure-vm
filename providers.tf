//terraform {
//  required_version = ">=0.12"

//  required_providers {
//    azurerm = {
//      source  = "hashicorp/azurerm"
//      version = "~>2.0"
//    }
//    random = {
//      source  = "hashicorp/random"
//      version = "~>3.0"
//    }
//    tls = {
//      source  = "hashicorp/tls"
//      version = "~>4.0"
//    }
//  }
//}

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
  client_secret   = "900a8b4b-f710-4a58-ab43-f52309d9996e"
  tenant_id       = "1acfa458-2c17-44e5-b9d8-ff851b6c7c5f"
}