variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    allocation_method   = string
    sku                 = optional(string, "Standard")
    sku_tier            = optional(string, "Regional")
    ip_version          = optional(string, "IPv4")
    zones               = optional(list(string))
    ddos = optional(object({
      mode    = optional(string)
      plan_id = optional(string)
    }), {})
    domain_name = optional(object({
      label       = optional(string)
      label_scope = optional(string)
    }), {})
    edge_zone = optional(string)
    ip_tags   = optional(map(string), {})
    tags      = map(any)
  })
}
