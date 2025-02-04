resource "azurerm_resource_group" "this" {
  name     = "${module.naming.resource_group.name}-${var.resource_settings.application_name}"
  location = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")

  tags = merge(local.tags, var.resource_settings.tags)

  timeouts {
    create = local.timeouts.create
    read   = local.timeouts.read
    update = local.timeouts.update
    delete = local.timeouts.delete
  }
}
