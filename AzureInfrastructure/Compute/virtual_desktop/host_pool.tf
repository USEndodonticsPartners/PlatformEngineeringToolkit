resource "azurerm_virtual_desktop_host_pool" "this" {
  name                = module.naming.virtual_desktop_host_pool.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.host_pool.resource_group_name
  type                = var.resource_settings.host_pool.type
  load_balancer_type  = var.resource_settings.host_pool.load_balancer_type
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "this" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.this.id
  expiration_date = "2026-01-01T23:40:52Z"
}
