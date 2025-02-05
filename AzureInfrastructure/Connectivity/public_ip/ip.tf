resource "azurerm_public_ip" "this" {
  name                = module.naming.public_ip.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  allocation_method   = var.resource_settings.allocation_method
  sku                 = var.resource_settings.sku
  sku_tier            = var.resource_settings.sku_tier
  ip_version          = var.resource_settings.ip_version
  zones               = var.resource_settings.zones
  edge_zone           = var.resource_settings.edge_zone
  ip_tags             = var.resource_settings.ip_tags

  ddos_protection_mode    = var.resource_settings.ddos.mode
  ddos_protection_plan_id = var.resource_settings.ddos.plan_id

  domain_name_label       = var.resource_settings.domain_name.label
  domain_name_label_scope = var.resource_settings.domain_name.label_scope

  tags = local.tags
}
