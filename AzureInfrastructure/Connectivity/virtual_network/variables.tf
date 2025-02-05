variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string), [])
    subnets = list(object({
      name                        = string
      address_prefixes            = list(string)
      security_group_id           = optional(string, "")
      default_outbound_access     = optional(bool, true)
      private_endpoint_policy     = optional(string, "Disabled")
      service_endpoints           = optional(list(string), [])
      service_endpoint_policy_ids = optional(list(string), [])
      delegation = optional(list(object({
        name = string
        service_delegation = list(object({
          name    = string
          actions = list(string)
        }))
      })), [])
    }))
    encryption = optional(object({
      enforcement = string
      }), {
      enforcement = "AllowUnencrypted"
    })
    ddos = optional(object({
      id = string
    }))
    tags = any
  })
}
