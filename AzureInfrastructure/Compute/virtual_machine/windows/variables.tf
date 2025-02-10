variable "global_settings" {}

variable "resource_settings" {
  type = object({
    resource_group_name          = string
    network_interface_ids        = list(string)
    size                         = string
    admin_username               = string
    admin_password               = string
    source_image_id              = optional(string)
    timezone                     = string
    availability_set_enabled   = bool
    os_disk = object({
      storage_account_type        = string
      caching                     = string
    })
    # identity = optional(object({
    #   identity_type = string
    #   identity_ids  = optional(list(string))
    # }))
    source_image_ref = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }), {})
    data_disks = optional(map(object({
      id = string
      lun = string
      caching = optional(string, "ReadWrite")
    })), {})
    extension = optional(map(object({
      name = string
      publisher = string
      type = string
      type_handler_version = string
      auto_upgrade_minor_version = string
      automatic_upgrade_enabled = string
      settings = string
      protected_settings = string
    })), {})
    tags = any
  })
}
