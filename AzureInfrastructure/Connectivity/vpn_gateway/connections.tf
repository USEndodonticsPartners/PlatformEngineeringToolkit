resource "azurerm_virtual_network_gateway_connection" "this" {
  for_each = var.resource_settings.connections

  name                            = "${module.naming.virtual_network_gateway_connection}-${each.value.name}"
  location                        = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name             = each.value.resource_group_name
  type                            = each.value.gw_connection_type
  virtual_network_gateway_id      = each.value.s2s_vpn == true ? join("", azurerm_virtual_network_gateway.this.id) : join("", azurerm_virtual_network_gateway.this.id)
  local_network_gateway_id        = each.value.gw_connection_type != "ExpressRoute" ? azurerm_local_network_gateway.this.id : null
  express_route_circuit_id        = each.value.gw_connection_type == "ExpressRoute" ? each.value.express_route_circuit_id : null
  peer_virtual_network_gateway_id = each.value.gw_connection_type == "Vnet2Vnet" ? each.value.peer_virtual_network_gateway_id : null
  shared_key                      = each.value.gw_connection_type != "ExpressRoute" ? var.resource_settings.local_gateway.shared_key : null
  connection_protocol             = each.value.gw_connection_type == "IPSec" && var.resource_settings.vpn_gateway.gw_sku == ["VpnGw1", "VpnGw2", "VpnGw3", "VpnGw1AZ", "VpnGw2AZ", "VpnGw3AZ"] ? each.value.gw_connection_protocol : null

  dynamic "ipsec_policy" {
    for_each = each.value.ipsec_policy

    content {
      dh_group         = local_networks_ipsec_policy.value["dh_group"]
      ike_encryption   = local_networks_ipsec_policy.value["ike_encryption"]
      ike_integrity    = local_networks_ipsec_policy.value["ike_integrity"]
      ipsec_encryption = local_networks_ipsec_policy.value["ipsec_encryption"]
      ipsec_integrity  = local_networks_ipsec_policy.value["ipsec_integrity"]
      pfs_group        = local_networks_ipsec_policy.value["pfs_group"]
      sa_datasize      = local_networks_ipsec_policy.value["sa_datasize"]
      sa_lifetime      = local_networks_ipsec_policy.value["sa_lifetime"]
    }
  }

  tags = local.tags
}
