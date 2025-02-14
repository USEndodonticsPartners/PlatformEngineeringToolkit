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
    })
    applications = optional(object({
      name             = string
      friendly_name    = string
      application_path = string
      cmd_arg_policy   = optional(string)
      cmd_args         = optional(string)
      portal_enabled   = optional(bool, true)
      icon_path        = optional(string)
      icon_index       = optional(string)
      description      = optional(string)
    }))
    scaling_plan = optional(object({
      enabled       = bool
      friendly_name = string
      time_zone     = string
      exclusion_tag = string
      description   = optional(string, "")
      schedule = object({
        name         = string
        days_of_week = list(string)
        peak = object({
          start_time          = string
          load_balancing_algo = string
        })
        off_peak = object({
          start_time          = string
          load_balancing_algo = string
        })
        ramp_up = object({
          start_time                 = string
          load_balancing_algo        = string
          capacity_threshold_percent = number
          min_hosts_percent          = number
        })
        ramp_down = object({
          start_time                 = string
          load_balancing_algo        = string
          stop_hosts_when            = string
          wait_time_mins             = number
          capacity_threshold_percent = number
          min_hosts_percent          = number
          notification_message       = string
          force_logoff_users         = bool
        })
      })
    }))
    tags = any
  })
}
