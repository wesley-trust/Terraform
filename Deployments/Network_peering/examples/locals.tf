# Calculate local variables
locals {

  # Resource
  resource_locations = lookup(var.service_location, "${terraform.workspace}", null)
}
