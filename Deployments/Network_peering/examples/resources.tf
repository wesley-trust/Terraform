module "virtual_machines_spoke" {
  for_each                = toset(local.resource_locations)
  source                  = "../Modules/Deployments/Windows_virtual_machine"
  service_environment     = var.service_environment
  service_deployment      = random_id.id
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = var.resource_network_role
}

module "virtual_machines_hub" {
  depends_on = [
    module.virtual_machines_spoke
  ]
  for_each                = toset(local.resource_locations)
  source                  = "../Modules/Deployments/Linux_virtual_machine"
  service_environment     = var.service_environment
  service_deployment      = random_id.id
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = var.resource_network_role
}

module "network_peering_spoke" {
  depends_on = [
    module.virtual_machines_hub
  ]
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = random_id.id
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.virtual_machines[each.value]
  resource_network_peer_role = var.resource_network_peer_role
}

module "network_peering_hub" {
  depends_on = [
    module.network_peering_spoke
  ]
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = random_id.id
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.virtual_machines[each.value]
  resource_network_peer_role = var.resource_network_peer_role
}
