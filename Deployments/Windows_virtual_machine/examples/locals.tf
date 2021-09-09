# Calculate local variables
locals {
  # Resource
  resource_name = lookup(var.resource_name, var.service_name, null)

  # Prod Specific
  resource_locations                        = lookup(var.service_location, "TEST", null)
  resource_instance_size                    = lookup(lookup(var.resource_instance_size, "TEST", null), var.service_name, null)
  resource_instance_count                   = lookup(lookup(var.resource_instance_count, "TEST", null), var.service_name, null)
  resource_recovery_services_locations      = lookup(var.service_recovery_services_location, "TEST", null)
  resource_recovery_services_instance_count = lookup(lookup(var.resource_recovery_services_instance_count, "TEST", null), var.service_name, null)
}