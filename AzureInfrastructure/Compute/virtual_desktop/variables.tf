variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name = string
    resource_group_name = string
    friendly_name = string
    description = optional(string)
  })
}
