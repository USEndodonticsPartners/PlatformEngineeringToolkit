variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    subnet_ids          = optional(map(string), {})
    routes = optional(list(object({
      name           = string
      address_prefix = string
      next_hop_type  = string
    })), [])
    tags = any
  })
}
