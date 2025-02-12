resource "azurerm_virtual_network_gateway" "this" {
  name                = module.naming.virtual_network_gateway.unique_name
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.vpn_gateway.resource_group_name
  type                = var.resource_settings.vpn_gateway.gateway_type
  vpn_type            = var.resource_settings.vpn_gateway.vpn_type
  sku                 = var.resource_settings.vpn_gateway.sku
  active_active       = var.resource_settings.vpn_gateway.sku != "Basic" ? var.resource_settings.vpn_gateway.active_active_enabled : false
  enable_bgp          = var.resource_settings.vpn_gateway.sku != "Basic" ? var.resource_settings.vpn_gateway.bgp_enabled : false
  generation          = var.resource_settings.vpn_gateway.generation

  dynamic "ip_configuration" {
    for_each = var.resource_settings.vpn_gateway.ip_configuration

    content {
      name                          = ip_configuration.value.name
      public_ip_address_id          = ip_configuration.value.pip_id
      private_ip_address_allocation = ip_configuration.value.vip_allocation
      subnet_id                     = ip_configuration.value.subnet_id
    }
  }

  dynamic "vpn_client_configuration" {
    for_each = var.resource_settings.vpn_gateway.vpn_client_configuration
    iterator = vpn

    content {
      address_space        = vpn.value.address_space
      vpn_client_protocols = vpn.value.client_protocols

      aad_tenant     = vpn.value.public_cert == "" ? vpn.value.aad_tenant : ""
      aad_audience   = vpn.value.public_cert == "" ? vpn.value.aad_audience : ""
      aad_issuer     = vpn.value.public_cert == "" ? vpn.value.aad_issuer : ""
      vpn_auth_types = vpn.value.public_cert == "" ? vpn.value.auth_types : ""

      root_certificate {
        name             = vpn.value.public_cert != "" ? "point-to-site-root-certifciate" : ""
        public_cert_data = vpn.value.public_cert != "" ? vpn.value.certificate : ""
      }
    }
  }
  tags = local.tags
}
