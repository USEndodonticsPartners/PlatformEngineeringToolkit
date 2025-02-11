# managed_disk

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
| [azurerm_managed_disk.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                       = string<br/>    resource_group_name        = string<br/>    account_type               = optional(string, "Standard_LRS")<br/>    create_option              = optional(string, "Empty")<br/>    disk_size                  = optional(number, 512)<br/>    tier                       = optional(string, "")<br/>    image_reference_id         = optional(string)<br/>    gallery_image_reference_id = optional(string)<br/>    source_uri                 = optional(string)<br/>    os_type                    = optional(string)<br/>    metadata                   = any<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
