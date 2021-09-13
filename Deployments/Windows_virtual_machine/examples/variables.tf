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

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = list(string)
  default = [
    "UK South",
    "North Central US"
  ]
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "Services" = "TST"
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = string
  default     = 1
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    Test = {
      "Services" = "Standard_B1s"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.2.0/24"
    "North Central US" = "10.6.2.0/24"
  }
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = map(any)
  default = {
    "UK South" = [
      "10.0.2.4",
      "10.0.2.5"
    ]

    "North Central US" = [
      "10.6.2.4",
      "10.6.2.5"
    ]
  }
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = "spoke"
}

variable "resource_data_disk_count" {
  description = "Desired size for the provisioned resources for each service"
  type        = number
  default     = 0
}

variable "resource_network_interface_count" {
  description = "Desired number of network interfaces"
  type        = string
  default     = 1
}

variable "provision_public_load_balancer" {
  description = "Whether to provision a public load balancer"
  type        = bool
  default     = false
}
