# virtual_desktop

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |
| <a name="module_tagging"></a> [tagging](#module\_tagging) | ../../Standards | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_virtual_desktop_application.chrome](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_application) | resource |
| [azurerm_virtual_desktop_application_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_application_group) | resource |
| [azurerm_virtual_desktop_host_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool) | resource |
| [azurerm_virtual_desktop_host_pool_registration_info.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool_registration_info) | resource |
| [azurerm_virtual_desktop_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace) | resource |
| [azurerm_virtual_desktop_workspace_application_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_workspace_application_group_association) | resource |
| [azurerm_virtual_machine_extension.aad_login](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.pool_register_this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_machine_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_windows_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [time_rotating.this](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                 = string<br/>    resource_group_name  = string<br/>    friendly_name        = string<br/>    type                 = string<br/>    load_balancer_type   = string<br/>    max_sessions_allowed = number<br/>    description          = optional(string)<br/>    app_group_type       = string<br/>    session_pool = object({<br/>      name                = string<br/>      count               = number<br/>      resource_group_name = string<br/>      computer_name       = string<br/>      key_vault_id        = string<br/>      storage_account_uri = string<br/>      timezone            = string<br/>      ip_configuration = object({<br/>        name       = string<br/>        subnet_id  = string<br/>        allocation = optional(string, "Dynamic")<br/>      })<br/>      vm_size             = string<br/>      admin_username      = string<br/>      secure_boot_enabled = bool<br/>      vtpm_enabled        = bool<br/>      os_disk = object({<br/>        caching      = string<br/>        storage_type = string<br/>        disk_size_gb = number<br/>      })<br/>      zone = number<br/>      source_image_ref = object({<br/>        publisher = string<br/>        offer     = string<br/>        sku       = string<br/>        version   = string<br/>      })<br/>      extension = optional(object({<br/>        name                 = string<br/>        publisher            = string<br/>        type                 = string<br/>        type_handler_version = string<br/>        data = object({<br/>          auto_upgrade_minor_version = bool<br/>          automatic_upgrade_enabled  = optional(bool, true)<br/>          settings                   = optional(string)<br/>          protected_settings         = optional(string)<br/>        })<br/>      }))<br/>    })<br/>    applications = optional(map(object({<br/>      name             = string<br/>      friendly_name    = string<br/>      application_path = string<br/>      cmd_arg_policy   = optional(string)<br/>      cmd_args         = optional(string)<br/>      portal_enabled   = optional(bool, true)<br/>      icon_path        = optional(string)<br/>      icon_index       = optional(string)<br/>      description      = optional(string)<br/>    })))<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_avd_host_pool_id"></a> [avd\_host\_pool\_id](#output\_avd\_host\_pool\_id) | n/a |
| <a name="output_avd_workspace_id"></a> [avd\_workspace\_id](#output\_avd\_workspace\_id) | n/a |
| <a name="output_registration_token"></a> [registration\_token](#output\_registration\_token) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
