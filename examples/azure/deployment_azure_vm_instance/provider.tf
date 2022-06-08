terraform {
  required_version = ">= 0.12.29"

  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.5.0"
    }

   azurerm = {
      source = "hashicorp/azurerm"
      version = "3.9.0"
    }
  }
}

provider "ec" {
  apikey = var.ec_api_key
}

provider "azurerm" {
  # Configuration options
  features {
  }
}


