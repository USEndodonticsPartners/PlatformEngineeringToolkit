variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    tenant_id                     = string
    name                          = string
    resource_group_name           = string
    enabled_for_disk_encryption   = optional(bool, false)
    purge_protection_enabled      = optional(bool, false)
    soft_delete_retention_days    = optional(number, 30)
    rbac_authorization_enabled    = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    sku                           = optional(string, "Standard")
    deployment_enabled            = optional(bool, true)
    template_deployment_enabled   = optional(bool, true)
    network_acls = optional(map(object({
      bypass          = bool
      default_actions = string
      ip_rules        = list(string)
      subnet_ids      = list(string)
    })), {})
    contacts = map(object({
      email = string
      name  = string
      phone = string
    }))
    access_policies = optional(map(object({
      object_id               = string
      key_permissions         = list(string)
      secret_permissions      = list(string)
      certificate_permissions = list(string)
    })), {})
    keys = optional(map(object({
      name        = string
      type        = string
      size        = number
      key_options = list(string)
      rotation_policy = optional(object({
        automatic = object({
          time_after_creation = optional(string)
          time_before_expiry  = string
        })
        expire_after         = string
        notify_before_expiry = string
      }))
    })), {})
    secrets = optional(map(object({
      name = string
      secret_config = object({
        length  = number
        special = string
      })
    })), {})
    certificate = optional(map(object({
      name     = string
      contents = string
      password = string
    })), {})
    tags = any
  })
}
