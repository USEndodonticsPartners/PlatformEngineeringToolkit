resource "azurerm_virtual_desktop_application_group" "this" {
  name                = module.naming.virtual_desktop_application_group.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.host_pool.resource_group_name
  type                = var.resource_settings.host_pool.app_group_type
  host_pool_id        = azurerm_virtual_desktop_host_pool.this.id
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "this" {
  workspace_id         = azurerm_virtual_desktop_workspace.this.id
  application_group_id = azurerm_virtual_desktop_application_group.this.id
}
