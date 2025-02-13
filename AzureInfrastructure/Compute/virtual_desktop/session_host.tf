resource "time_rotating" "this" {
  # Must be between 1 hour and 30 days
  rotation_days = 29
}

resource "azurerm_virtual_desktop_host_pool" "this" {
  name                     = module.naming.virtual_desktop_host_pool.name_unique
  location                 = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name      = var.resource_settings.resource_group_name
  type                     = var.resource_settings.type
  load_balancer_type       = var.resource_settings.load_balancer_type
  custom_rdp_properties    = "enablerdsaadauth:i:0"
  maximum_sessions_allowed = var.resource_settings.max_sessions_allowed
  validate_environment     = true
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "this" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.this.id
  expiration_date = time_rotating.this.rotation_rfc3339

  depends_on = [
    azurerm_virtual_desktop_host_pool.this,
    azurerm_virtual_desktop_workspace.this,
    time_rotating.this
  ]
}
