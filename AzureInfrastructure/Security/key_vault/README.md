# key_vault

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
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    tenant_id                     = string<br/>    name                          = string<br/>    resource_group_name           = string<br/>    enabled_for_disk_encryption   = optional(bool, false)<br/>    purge_protection_enabled      = optional(bool, false)<br/>    soft_delete_retention_days    = optional(number, 30)<br/>    rbac_authorization_enabled    = optional(bool, false)<br/>    public_network_access_enabled = optional(bool, true)<br/>    sku                           = optional(string, "standard")<br/>    deployment_enabled            = optional(bool, true)<br/>    template_deployment_enabled   = optional(bool, true)<br/>    network_acls = optional(map(object({<br/>      bypass          = bool<br/>      default_actions = string<br/>      ip_rules        = list(string)<br/>      subnet_ids      = list(string)<br/>    })), {})<br/>    contacts = map(object({<br/>      email = string<br/>      name  = string<br/>      phone = string<br/>    }))<br/>    access_policies = optional(map(object({<br/>      object_id               = string<br/>      key_permissions         = list(string)<br/>      secret_permissions      = list(string)<br/>      certificate_permissions = list(string)<br/>    })), {})<br/>    keys = optional(map(object({<br/>      name        = string<br/>      type        = string<br/>      size        = number<br/>      key_options = list(string)<br/>      rotation_policy = optional(object({<br/>        automatic = object({<br/>          time_after_creation = optional(string)<br/>          time_before_expiry  = string<br/>        })<br/>        expire_after         = string<br/>        notify_before_expiry = string<br/>      }))<br/>    })), {})<br/>    secrets = optional(map(object({<br/>      name = string<br/>      secret_config = object({<br/>        length  = number<br/>        special = string<br/>      })<br/>    })), {})<br/>    certificate = optional(map(object({<br/>      name     = string<br/>      contents = string<br/>      password = string<br/>    })), {})<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
