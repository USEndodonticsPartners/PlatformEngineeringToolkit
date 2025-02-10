resource "azurerm_availability_set" "this" {
  count = var.resource_settings.availability_set_enabled ? 1 : 0

  name                = module.naming.availability_set.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  tags = local.tags
}
