# Define variables
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

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Test = [
      "UK South",
      "North Central US"
    ]
  }
}

variable "resource_network_peer_role" {
  description = "The peering type"
  type        = string
  default = "spoke"
}