# bastion_host

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
| [azurerm_bastion_host.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                = string<br/>    resource_group_name = string<br/>    sku                 = optional(string, "Basic")<br/>    configfurations = object({<br/>      ip_connect_enabled     = optional(bool, false)<br/>      copy_paste_enabled     = optional(bool, true)<br/>      scale_units            = optional(number, 2)<br/>      shareable_link_enabled = optional(string, null)<br/>      file_copy_enabled      = optional(bool, null)<br/>      tunneling_enabled      = optional(bool, null)<br/>    })<br/>    ip_configuration = object({<br/>      name      = string<br/>      subnet_id = string<br/>      pip_id    = string<br/>    })<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | Specifies the name of the bastion host. |
| <a name="output_id"></a> [id](#output\_id) | Specifies the resource id of the bastion host. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
