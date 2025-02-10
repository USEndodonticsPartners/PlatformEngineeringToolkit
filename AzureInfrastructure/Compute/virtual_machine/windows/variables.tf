variable "global_settings" {}

variable "resource_settings" {
  type = object({
    resource_group_name          = string
    network_interface_ids        = list(string)
    size                         = string
    admin_username               = string
    admin_password               = string
    source_image_id              = string
    provision_vm_agent           = bool
    extension_operations_enabled = bool
    dedicated_host_id            = string
    automatic_updates_enabled    = bool
    license_type                 = string
    availability_set_id          = string
    encryption_at_host_enabled   = bool
    proximity_placement_group_id = string
    patch_mode                   = string
    patch_assessment_mode        = string
    zone                         = string
    timezone                     = string
    os_disk = object({
      name                        = string
      storage_account_type        = string
      caching                     = string
      disk_encryption_set_enabled = bool
      size_gb                     = number
      write_accelerator_enabled   = bool
    })
    boot_diag = optional(object({
      blob_endpoint = string
    }))
    additional_capabilities = optional(object({
      ultra_ssd_enabled = bool
    }))
    identity = optional(object({
      identity_type = string
      identity_ids  = optional(list(string))
    }))
    source_image_ref = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
    data_disks = optional(map(object({
      id = string
      lun = string
      caching = optional(string, "ReadWrite")
    })))
    extension = optional(map(object({
      name = string
      publisher = string
      type = string
      type_handler_version = string
      auto_upgrade_minor_version = string
      automatic_upgrade_enabled = string
      settings = string
      protected_settings = string
    })))
    tags = any
  })
}
