# storage_account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |
| <a name="module_tagging"></a> [tagging](#module\_tagging) | ../../Standards | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_share.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                  = string<br/>    resource_group_name   = string<br/>    tier                  = optional(string, "Standard")<br/>    replication_type      = optional(string, "GRS")<br/>    kind                  = optional(string, "StorageV2")<br/>    access_tier           = optional(string, "Hot")<br/>    https_only_enabled    = optional(bool, false)<br/>    min_tls_version       = optional(string, "TLS1_2")<br/>    public_access_enabled = optional(bool, false)<br/>    hns_enabled           = optional(bool, false)<br/>    nfsv3_enabled         = optional(bool, false)<br/>    network_rules = optional(map(object({<br/>      bypass         = optional(list(string), [])<br/>      default_action = optional(string)<br/>      ip_rules       = optional(list(string), [])<br/>      subnet_ids     = optional(list(string), [])<br/>      private_link = optional(object({<br/>        resource_id = optional(string)<br/>        tenant_id   = optional(string)<br/>      }), {})<br/>    })), {})<br/>    azure_files_authentication = optional(object({<br/>      directory_type                  = string<br/>      default_share_level_permissions = string<br/>    }))<br/>    azure_file_shares = optional(map(object({<br/>      share_name = string<br/>      quota      = optional(number, 50)<br/>    })))<br/>    blob_properties = optional(object({<br/>      versioning_enabled       = optional(bool)<br/>      change_feed_enabled      = optional(bool)<br/>      change_feed_retention    = optional(number)<br/>      last_access_time_enabled = optional(bool)<br/>      default_service_version  = optional(string)<br/>      container_delete_retention_policy = optional(object({<br/>        days = optional(number)<br/>      }), {})<br/>      cors_rule = optional(object({<br/>        allowed_headers = optional(list(string), [])<br/>        allowed_methods = optional(list(string), [])<br/>        allowed_origins = optional(list(string), [])<br/>        exposed_headers = optional(list(string), [])<br/>        max_age_in_sec  = optional(number)<br/>      }), {})<br/>      delete_retention_policy = optional(object({<br/>        days                     = optional(number)<br/>        permanent_delete_enabled = optional(bool, false)<br/>      }), {})<br/>    }), {})<br/>    cmk = optional(object({<br/>      key_id           = optional(string)<br/>      hsm_key_id       = optional(string)<br/>      user_assigned_id = optional(string)<br/>    }), {})<br/>    custom_domain = optional(object({<br/>      name              = optional(string)<br/>      subdomain_enabled = optional(string)<br/>    }), {})<br/>    identity = optional(object({<br/>      type         = optional(string, "SystemAssigned")<br/>      identity_ids = optional(list(string))<br/>    }), {})<br/>    routing = optional(object({<br/>      internet_publishing  = optional(bool, false)<br/>      microsoft_publishing = optional(bool, true)<br/>      choice               = optional(string, "MicrosoftRouting")<br/>    }), {})<br/>    containers = optional(map(object({<br/>      default_encryption_scope = optional(bool, false)<br/>      access_type              = optional(string, "private")<br/>      container_metadata       = optional(map(string))<br/>    })), {})<br/>    blob = optional(map(object({<br/>      container_name = optional(string)<br/>      type           = optional(string, "Block")<br/>      source_type    = optional(string, "source_content")<br/>      source_content = optional(string)<br/>      source_uri     = optional(string)<br/>    })), {})<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_uri"></a> [storage\_account\_uri](#output\_storage\_account\_uri) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
