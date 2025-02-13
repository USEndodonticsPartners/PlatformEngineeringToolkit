variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                 = string
    resource_group_name  = string
    friendly_name        = string
    type                 = string
    load_balancer_type   = string
    max_sessions_allowed = number
    description          = optional(string)
    app_group_type       = string
    session_pool = object({
      name                = string
      count               = number
      resource_group_name = string
      computer_name       = string
      key_vault_id        = string
      storage_account_uri = string
      timezone            = string
      ip_configuration = object({
        name       = string
        subnet_id  = string
        allocation = optional(string, "Dynamic")
      })
      vm_size             = string
      admin_username      = string
      secure_boot_enabled = bool
      vtpm_enabled        = bool
      os_disk = object({
        caching      = string
        storage_type = string
        disk_size_gb = number
      })
      zone = number
      source_image_ref = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
      })
      extension = optional(map(object({
        name                 = string
        publisher            = string
        type                 = string
        type_handler_version = string
        data = object({
          auto_upgrade_minor_version = bool
          automatic_upgrade_enabled  = optional(bool, true)
          settings                   = optional(string)
          protected_settings         = optional(string)
        })
      })), {})
    })
    applications = optional(map(object({
      name             = string
      friendly_name    = string
      application_path = string
      cmd_arg_policy   = optional(string)
      cmd_args         = optional(string)
      portal_enabled   = optional(bool, true)
      icon_path        = optional(string)
      icon_index       = optional(string)
      description      = optional(string)
    })))
    tags = any
  })
}
