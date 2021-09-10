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

/* module "linux_virtual_machine_hub" {
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
} */

module "network_peering_spoke" {
  depends_on = [
    module.windows_virtual_machine_spoke
  ]
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Spoke"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.windows_virtual_machine_spoke[each.value]
  resource_network_peer_role = "hub"
}

/* module "network_peering_hub" {
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Hub"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.linux_virtual_machine_hub[each.value]
  resource_network_peer_role = "spoke"
} */