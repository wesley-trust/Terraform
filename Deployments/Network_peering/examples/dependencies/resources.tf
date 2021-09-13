module "resource_group_spoke" {
  for_each            = toset(var.service_location)
  source              = "../../../Resource_group"
  service_environment = var.service_environment
  service_name        = var.service_name
  service_location    = each.value
  service_deployment  = "${var.service_deployment}-Spoke"
}

module "service_network_spoke" {
  for_each                = toset(var.service_location)
  source                  = "../../../../Resources/Network"
  service_name            = var.service_name
  service_location_prefix = local.service_location_prefix
  resource_location       = module.resource_group_hub.location
  resource_group_name     = module.resource_group_hub.name
  resource_environment    = var.service_environment
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  #resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = "spoke"
}

module "resource_group_hub" {
  for_each            = toset(var.service_location)
  source              = "../../../Resource_group"
  service_environment = var.service_environment
  service_name        = var.service_name
  service_location    = each.value
  service_deployment  = "${var.service_deployment}-Hub"
}

module "service_network_hub" {
  for_each                = toset(var.service_location)
  source                  = "../../../../Resources/Network"
  service_name            = var.service_name
  service_location_prefix = local.service_location_prefix
  resource_location       = module.resource_group_hub.location
  resource_group_name     = module.resource_group_hub.name
  resource_environment    = var.service_environment
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  #resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = "hub"
}