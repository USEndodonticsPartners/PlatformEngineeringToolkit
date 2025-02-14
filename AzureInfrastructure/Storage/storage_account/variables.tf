variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                  = string
    resource_group_name   = string
    tier                  = optional(string, "Standard")
    replication_type      = optional(string, "GRS")
    kind                  = optional(string, "StorageV2")
    access_tier           = optional(string, "Hot")
    https_only_enabled    = optional(bool, false)
    min_tls_version       = optional(string, "TLS1_2")
    public_access_enabled = optional(bool, false)
    hns_enabled           = optional(bool, false)
    nfsv3_enabled         = optional(bool, false)
    network_rules = optional(map(object({
      bypass         = optional(list(string), [])
      default_action = optional(string)
      ip_rules       = optional(list(string), [])
      subnet_ids     = optional(list(string), [])
      private_link = optional(object({
        resource_id = optional(string)
        tenant_id   = optional(string)
      }), {})
    })), {})
    azure_files_authentication = optional(object({
      directory_type                  = string
      default_share_level_permissions = string
    }))
    azure_file_shares = optional(map(object({
      share_name = string
      quota      = optional(number, 50)
    })))
    blob_properties = optional(object({
      versioning_enabled       = optional(bool)
      change_feed_enabled      = optional(bool)
      change_feed_retention    = optional(number)
      last_access_time_enabled = optional(bool)
      default_service_version  = optional(string)
      container_delete_retention_policy = optional(object({
        days = optional(number)
      }), {})
      cors_rule = optional(object({
        allowed_headers = optional(list(string), [])
        allowed_methods = optional(list(string), [])
        allowed_origins = optional(list(string), [])
        exposed_headers = optional(list(string), [])
        max_age_in_sec  = optional(number)
      }), {})
      delete_retention_policy = optional(object({
        days                     = optional(number)
        permanent_delete_enabled = optional(bool, false)
      }), {})
    }), {})
    cmk = optional(object({
      key_id           = optional(string)
      hsm_key_id       = optional(string)
      user_assigned_id = optional(string)
    }), {})
    custom_domain = optional(object({
      name              = optional(string)
      subdomain_enabled = optional(string)
    }), {})
    identity = optional(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string))
    }), {})
    routing = optional(object({
      internet_publishing  = optional(bool, false)
      microsoft_publishing = optional(bool, true)
      choice               = optional(string, "MicrosoftRouting")
    }), {})
    containers = optional(map(object({
      default_encryption_scope = optional(bool, false)
      access_type              = optional(string, "private")
      container_metadata       = optional(map(string))
    })), {})
    blob = optional(map(object({
      container_name = optional(string)
      type           = optional(string, "Block")
      source_type    = optional(string, "source_content")
      source_content = optional(string)
      source_uri     = optional(string)
    })), {})
    tags = any
  })
}
