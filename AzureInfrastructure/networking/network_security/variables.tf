variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    ip_configuration = object({
      name                = string
      vip_address_version = optional(string, "IPv4")
      subnet_id           = optional(string)
      vip_allocation      = optional(string, "Dynamic")
      public_ip_enabled   = optional(bool, false)
      pip_id              = optional(string)
      vip_address         = optional(string)
    })
    tags = any
  })
}
