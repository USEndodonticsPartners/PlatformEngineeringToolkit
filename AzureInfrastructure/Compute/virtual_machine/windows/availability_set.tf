resource "azurerm_availability_set" "this" {
  name                         = module.naming.availability_set.name_unique
  location                     = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name          = var.resource_settings.resource_group_name
  platform_update_domain_count = var.resource_settings.availability_set.update_domain_count
  platform_fault_domain_count  = var.resource_settings.availability_set.fault_domain_count
  tags                         = local.tags
}
