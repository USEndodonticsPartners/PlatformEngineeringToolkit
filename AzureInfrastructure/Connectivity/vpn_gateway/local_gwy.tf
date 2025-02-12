resource "azurerm_local_network_gateway" "this" {
  name                = "${module.naming.local_network_gateway.name}-${var.resource_settings.local_gateway.name}"
  location            = azurerm_virtual_network_gateway.this.location
  resource_group_name = azurerm_virtual_network_gateway.this.resource_group_name
  gateway_address     = var.resource_settings.local_gateway.gw_address
  address_space       = var.resource_settings.local_gateway.address_space

  dynamic "bgp_settings" {
    for_each = var.resource_settings.local_gateway.bgp_settings

    content {
      asn                 = var.resource_settings.local_gateway.bgp_settings.asn_number
      bgp_peering_address = var.resource_settings.local_gateway.local_bgp_settings.peering_address
      peer_weight         = var.resource_settings.local_gateway.local_bgp_settings.peer_weight
    }
  }
  tags = local.tags
}
