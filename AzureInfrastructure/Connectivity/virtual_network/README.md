# virtual_network

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
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    name                = string<br/>    resource_group_name = string<br/>    address_space       = list(string)<br/>    dns_servers         = optional(list(string), [])<br/>    subnets = optional(map(object({<br/>      name                        = string<br/>      address_prefixes            = list(string)<br/>      security_group_id           = optional(string, "")<br/>      default_outbound_access     = optional(bool, true)<br/>      private_endpoint_policy     = optional(string, "Disabled")<br/>      service_endpoints           = optional(list(string), [])<br/>      service_endpoint_policy_ids = optional(list(string), [])<br/>      delegation = optional(list(object({<br/>        name = string<br/>        service_delegation = list(object({<br/>          name    = string<br/>          actions = list(string)<br/>        }))<br/>      })), [])<br/>    })), {})<br/>    encryption = optional(object({<br/>      enforcement = string<br/>      }), {<br/>      enforcement = "AllowUnencrypted"<br/>    })<br/>    ddos = optional(object({<br/>      id = string<br/>    }))<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_virtual_network_address_space"></a> [virtual\_network\_address\_space](#output\_virtual\_network\_address\_space) | n/a |
| <a name="output_virtual_network_guid"></a> [virtual\_network\_guid](#output\_virtual\_network\_guid) | n/a |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | n/a |
| <a name="output_virtual_network_location"></a> [virtual\_network\_location](#output\_virtual\_network\_location) | n/a |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
