# Set required providers and versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.70, < 3.0.0"
    }
  }
}

# Configure Providers
provider "azurerm" {
  features {

  }
}