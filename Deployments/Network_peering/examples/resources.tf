module "network_peering_spoke" {
  for_each                   = toset(var.service_location)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Spoke"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = var.service_network_spoke[index(keys(toset(var.service_location), each.key))]
  #resource_network_peer      = element(var.service_network_spoke, index(toset(var.service_location), each.key))
  resource_network_peer_role = "hub"
}

module "network_peering_hub" {
  for_each                   = toset(var.service_location)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = "${var.service_deployment}-Hub"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = var.service_network_hub[index(keys(toset(var.service_location), each.key))]
  #resource_network_peer      = element(var.service_network_hub, index(toset(var.service_location), each.key))
  resource_network_peer_role = "spoke"
}