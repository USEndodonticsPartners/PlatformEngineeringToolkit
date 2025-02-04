resource "azurerm_management_lock" "this" {
  count = try(var.global_settings.environment == "Development" || var.global_settings.environment == "DevTest" ? 0 : 1)

  name       = "resource-group-lock"
  scope      = azurerm_resource_group.this.id
  lock_level = "CanNotDelete"
  notes      = "Disable deletion of resources"

  timeouts {
    create = local.timeouts.create
    read   = local.timeouts.read
    delete = local.timeouts.delete
  }

  depends_on = [
    azurerm_resource_group.this
  ]
}
