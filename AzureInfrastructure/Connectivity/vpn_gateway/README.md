# vpn_gateway

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
| [azurerm_local_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | `any` | n/a | yes |
| <a name="input_resource_settings"></a> [resource\_settings](#input\_resource\_settings) | n/a | <pre>object({<br/>    vpn_gateway = object({<br/>      name                  = string<br/>      resource_group_name   = string<br/>      gateway_type          = string<br/>      vpn_type              = string<br/>      sku                   = string<br/>      active_active_enabled = bool<br/>      bgp_enabled           = bool<br/>      generation            = optional(string)<br/>      ip_configuration = map(object({<br/>        name           = string<br/>        pip_id         = string<br/>        vip_allocation = string<br/>        subnet_id      = string<br/>      }))<br/>      vpn_client_configuration = object({<br/>        client_protocals = list(string)<br/>        address_space    = list(string)<br/>        aad_tenant       = optional(string, "")<br/>        aad_audience     = optional(string, "")<br/>        aad_issuer       = optional(string, "")<br/>        auth_types       = optional(list(string), [])<br/>        public_cert      = optional(string, "")<br/>      })<br/>    })<br/>    local_gateway = object({<br/>      name          = string<br/>      gw_address    = string<br/>      address_space = list(string)<br/>      bgp_settings = map(object({<br/>        asn_number      = number<br/>        peering_address = string<br/>        peer_weight     = number<br/>      }))<br/>    })<br/>    connections = map(object({<br/>      name                            = string<br/>      resource_group_name             = string<br/>      gw_connection_type              = string<br/>      is_s2s                          = optional(bool, true)<br/>      express_route_circuit_id        = optional(string)<br/>      peer_virtual_network_gateway_id = optional(string)<br/>      shared_key                      = optional(string)<br/>      gw_connection_protocol          = optional(string, "IPSec")<br/>      ipsec_policy = map(object({<br/>        dh_group         = string<br/>        ike_encryption   = string<br/>        ike_integrity    = string<br/>        ipsec_encryption = string<br/>        ipsec_integrity  = string<br/>        pfs_group        = string<br/>        sa_datasize      = string<br/>        sa_lifetime      = string<br/>      }))<br/>    }))<br/>    tags = any<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
