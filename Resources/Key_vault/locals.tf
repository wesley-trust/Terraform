# Calculate local variables
locals {

  # Resource functions and concatenations
  resource_key_vault_name = lower("${var.resource_name}-${var.resource_deployment}-${random_id.id.hex}")
}