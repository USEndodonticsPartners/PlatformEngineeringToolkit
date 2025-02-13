resource "azurerm_virtual_machine_extension" "this" {
  count    = var.resource_settings.session_pool.count
  for_each = var.resource_settings.extension

  name                       = each.value.name
  virtual_machine_id         = azurerm_windows_virtual_machine.this[count.index].id
  publisher                  = each.value.publisher
  type                       = each.value.type
  type_handler_version       = each.value.type_handler_version
  auto_upgrade_minor_version = lookup(each.value.data, "auto_upgrade_minor_version", null)
  automatic_upgrade_enabled  = lookup(each.value.data, "automatic_upgrade_enabled", null)
  settings                   = lookup(each.value.data, "settings", null)
  protected_settings         = lookup(each.value.data, "protected_settings", null)
}
