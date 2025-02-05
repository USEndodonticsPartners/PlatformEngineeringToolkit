variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    subnet_ids          = optional(map(string), {})
    security_rules = optional(map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), {})
    tags = any
  })
}
