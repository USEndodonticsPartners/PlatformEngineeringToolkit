variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    local_network = object({
      name = string
      resource_group_name = string
      id = string
    })
    remote_network = object({
      name = string
      resource_group_name = string
      id = string
    })
  })
}
