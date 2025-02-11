variable "global_settings" {}

variable "resource_settings" {
  type = object({
    name                  = string
    resource_group_name   = string
    network_interface_ids = list(string)
    size                  = string
    admin_username        = string
    admin_password        = string
    source_image_id       = optional(string)
    timezone              = string
    availability_set = object({
      update_domain_count = optional(number, 5)
      fault_domain_count  = optional(number, 3)
    })
    os_disk = object({
      storage_account_type = string
      caching              = string
    })
    # identity = optional(object({
    #   identity_type = string
    #   identity_ids  = optional(list(string))
    # }))
    source_image_ref = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    data_disks = optional(map(object({
      name                 = string
      storage_account_type = string
      create_option        = optional(string, "Empty")
      disk_size_gb         = number
      lun                  = number
      caching              = optional(string, "ReadWrite")
    })), {})
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
    tags = any
  })
}
