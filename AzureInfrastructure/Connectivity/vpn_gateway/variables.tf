variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    vpn_gateway = object({
      name                  = string
      resource_group_name   = string
      gateway_type          = string
      vpn_type              = string
      sku                   = string
      active_active_enabled = bool
      bgp_enabled           = bool
      generation            = optional(string)
      ip_configuration = map(object({
        name           = string
        pip_id         = string
        vip_allocation = string
        subnet_id      = string
      }))
      vpn_client_configuration = object({
        client_protocals = list(string)
        address_space    = list(string)
        aad_tenant       = optional(string, "")
        aad_audience     = optional(string, "")
        aad_issuer       = optional(string, "")
        auth_types       = optional(list(string), [])
        public_cert      = optional(string, "")
      })
    })
    local_gateway = object({
      name          = string
      gw_address    = string
      address_space = list(string)
      bgp_settings = map(object({
        asn_number      = number
        peering_address = string
        peer_weight     = number
      }))
    })
    connections = map(object({
      name                            = string
      resource_group_name             = string
      gw_connection_type              = string
      is_s2s                          = optional(bool, true)
      express_route_circuit_id        = optional(string)
      peer_virtual_network_gateway_id = optional(string)
      shared_key                      = optional(string)
      gw_connection_protocol          = optional(string, "IPSec")
      ipsec_policy = map(object({
        dh_group         = string
        ike_encryption   = string
        ike_integrity    = string
        ipsec_encryption = string
        ipsec_integrity  = string
        pfs_group        = string
        sa_datasize      = string
        sa_lifetime      = string
      }))
    }))
    tags = any
  })
}
