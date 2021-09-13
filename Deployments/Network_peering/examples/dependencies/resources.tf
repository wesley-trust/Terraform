module "windows_virtual_machine_spoke" {
  for_each                = toset(local.resource_locations)
  source                  = "../../Windows_virtual_machine"
  service_environment     = var.service_environment
  service_deployment      = "${var.service_deployment}-Spoke"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = "spoke"
}

module "linux_virtual_machine_hub" {
  for_each                = toset(local.resource_locations)
  source                  = "../../Linux_virtual_machine"
  service_environment     = var.service_environment
  service_deployment      = "${var.service_deployment}-Hub"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = "hub"
}