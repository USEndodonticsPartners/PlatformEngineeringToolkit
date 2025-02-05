# public_ip

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
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                = string<br/>    resource_group_name = string<br/>    allocation_method   = string<br/>    sku                 = optional(string, "Standard")<br/>    sku_tier            = optional(string, "Regional")<br/>    ip_version          = optional(string, "IPv4")<br/>    zones               = optional(list(string))<br/>    ddos = optional(object({<br/>      mode    = optional(string)<br/>      plan_id = optional(string)<br/>    }), {})<br/>    domain_name = optional(object({<br/>      label       = optional(string)<br/>      label_scope = optional(string)<br/>    }), {})<br/>    edge_zone = optional(string)<br/>    ip_tags   = optional(map(string), {})<br/>    tags      = map(any)<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | n/a |
| <a name="output_public_ip_name"></a> [public\_ip\_name](#output\_public\_ip\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
