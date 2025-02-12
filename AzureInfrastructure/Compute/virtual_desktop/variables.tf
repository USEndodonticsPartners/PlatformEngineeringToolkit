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
    session_pool = object({
      name                = string
      count               = number
      resource_group_name = string
      key_vault_id        = string
      ip_configuration = object({
        name       = string
        subnet_id  = string
        allocation = optional(string, "Dynamic")
      })
      vm_size        = string
      admin_username = string
      os_disk = object({
        caching      = string
        storage_type = string
      })
      source_image_ref = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
      })
    })
    tags = any
  })
}
