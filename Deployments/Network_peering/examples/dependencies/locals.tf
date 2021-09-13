# Calculate local variables
locals {
  # Resource
  resource_name = lookup(var.resource_name, var.service_name, null)

  # Prod Specific
  resource_instance_size  = lookup(lookup(var.resource_instance_size, "Test", null), var.service_name, null)
}