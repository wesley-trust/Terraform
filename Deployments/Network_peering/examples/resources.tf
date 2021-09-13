module "network_peering_spoke" {
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Spoke"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = var.virtual_machine_spoke[each.value]
  resource_network_peer_role = "hub"
}

module "network_peering_hub" {
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Hub"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = var.virtual_machine_hub[each.value]
  resource_network_peer_role = "spoke"
}
