variable "global_settings" {}

variable "resource_settings" {
  type = object({
    resource_group_name = string
    sku                 = string
    configfurations = object({
      ip_connect_enabled     = optional(bool, false)
      copy_paste_enabled     = optional(bool, true)
      scale_units            = optional(number, 2)
      shareable_link_enabled = optional(string, null)
      file_copy_enabled      = optional(bool, null)
      tunneling_enabled      = optional(bool, null)
    })
    ip_configurations = object({
      name      = string
      subnet_id = string
      pip_id    = string
    })
    tags = any
  })
}
