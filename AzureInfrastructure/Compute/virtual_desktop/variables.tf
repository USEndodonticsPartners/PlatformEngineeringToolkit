variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                = string
    resource_group_name = string
    friendly_name       = string
    type                = string
    load_balancer_type  = string
    description         = optional(string)
    tags                = any
  })
}
