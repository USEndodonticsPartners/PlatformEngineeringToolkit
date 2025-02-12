resource "azurerm_virtual_desktop_workspace" "this" {
  name                = module.naming.virtual_desktop_workspace.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  friendly_name       = var.resource_settings.friendly_name
  description         = var.resource_settings.description
}
