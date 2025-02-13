resource "azurerm_virtual_machine_extension" "this" {
  for_each                   = var.resource_settings.session_pool.extension
  count                      = length(azurerm_windows_virtual_machine.this)
  name                       = var.resource_settings.session_pool.extension.name
  virtual_machine_id         = azurerm_windows_virtual_machine.this[count.index].id
  publisher                  = var.resource_settings.session_pool.extension.publisher
  type                       = var.resource_settings.session_pool.extension.type
  type_handler_version       = var.resource_settings.session_pool.extension.type_handler_version
  auto_upgrade_minor_version = lookup(var.resource_settings.session_pool.extension.data, "auto_upgrade_minor_version", null)
  automatic_upgrade_enabled  = lookup(var.resource_settings.session_pool.extension.data, "automatic_upgrade_enabled", null)
  settings                   = lookup(var.resource_settings.session_pool.extension.data, "settings", null)
  protected_settings         = lookup(var.resource_settings.session_pool.extension.data, "protected_settings", null)
}
