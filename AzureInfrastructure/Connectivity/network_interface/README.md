# network_interface

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
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                = string<br/>    resource_group_name = string<br/>    ip_configuration = object({<br/>      name                = string<br/>      vip_address_version = optional(string, "IPv4")<br/>      subnet_id           = optional(string)<br/>      vip_allocation      = optional(string, "Dynamic")<br/>      public_ip_enabled   = optional(bool, false)<br/>      pip_id              = optional(string)<br/>      vip_address         = optional(string)<br/>    })<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_interface_id"></a> [network\_interface\_id](#output\_network\_interface\_id) | The ID of the Resource Group. |
| <a name="output_network_interface_vip"></a> [network\_interface\_vip](#output\_network\_interface\_vip) | The ID of the Resource Group. |
| <a name="output_network_interface_vm_id"></a> [network\_interface\_vm\_id](#output\_network\_interface\_vm\_id) | The ID of the Resource Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
