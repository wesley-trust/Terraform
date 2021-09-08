module "network_peering" {
  for_each                   = toset(local.resource_locations)
  source                     = "../"
  service_environment        = var.service_environment
  service_deployment         = random_id.id
  service_name               = var.service_name
  service_location           = each.value
  #resource_network_peer      = module.virtual_machines[each.value]
  resource_network_peer_role = var.resource_network_peer_role
}