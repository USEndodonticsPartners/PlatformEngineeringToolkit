# windows

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |
| <a name="module_tagging"></a> [tagging](#module\_tagging) | ../../../Standards | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_key_vault_secret.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_managed_disk.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_virtual_machine_data_disk_attachment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_machine_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_windows_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                  = string<br/>    resource_group_name   = string<br/>    network_interface_ids = list(string)<br/>    size                  = string<br/>    key_vault_id          = string<br/>    admin_username        = string<br/>    source_image_id       = optional(string)<br/>    timezone              = string<br/>    availability_set = object({<br/>      update_domain_count = optional(number, 5)<br/>      fault_domain_count  = optional(number, 3)<br/>    })<br/>    os_disk = object({<br/>      storage_account_type = string<br/>      caching              = string<br/>    })<br/>    # identity = optional(object({<br/>    #   identity_type = string<br/>    #   identity_ids  = optional(list(string))<br/>    # }))<br/>    source_image_ref = object({<br/>      publisher = string<br/>      offer     = string<br/>      sku       = string<br/>      version   = string<br/>    })<br/>    data_disks = optional(map(object({<br/>      name                 = string<br/>      storage_account_type = string<br/>      create_option        = optional(string, "Empty")<br/>      disk_size_gb         = number<br/>      lun                  = number<br/>      caching              = optional(string, "ReadWrite")<br/>    })), {})<br/>    extension = optional(map(object({<br/>      name                 = string<br/>      publisher            = string<br/>      type                 = string<br/>      type_handler_version = string<br/>      data = object({<br/>        auto_upgrade_minor_version = bool<br/>        automatic_upgrade_enabled  = optional(bool, true)<br/>        settings                   = optional(string)<br/>        protected_settings         = optional(string)<br/>      })<br/>    })), {})<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_password"></a> [vm\_password](#output\_vm\_password) | Password to the deployed VM |
| <a name="output_windows_virtual_machine_id"></a> [windows\_virtual\_machine\_id](#output\_windows\_virtual\_machine\_id) | The ID of the Windows Virtual Machine. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
