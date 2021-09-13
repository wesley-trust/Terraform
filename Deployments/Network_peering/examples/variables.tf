# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "Services"
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
  default     = "Test"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = list(string)
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
}

# Required resource variables
variable "resource_network_peer_spoke" {
  description = "Resource outputs for peering"
  type        = any
}

variable "resource_network_peer_hub" {
  description = "Resource outputs for peering"
  type        = any
}