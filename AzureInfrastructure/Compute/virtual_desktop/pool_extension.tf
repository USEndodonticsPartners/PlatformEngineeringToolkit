resource "azurerm_virtual_machine_extension" "this" {
  count                      = length(azurerm_windows_virtual_machine.this) * length(keys(var.resource_settings.session_pool.extension))
  name                       = "${element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))}-extension-${count.index / length(var.resource_settings.session_pool.extension)}"
  virtual_machine_id         = azurerm_windows_virtual_machine.vm[count.index / length(var.resource_settings.session_pool.extension)].id
  publisher                  = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].publisher
  type                       = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].type
  type_handler_version       = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].type_handler_version
  auto_upgrade_minor_version = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].auto_upgrade_minor_version
  automatic_upgrade_enabled  = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].automatic_upgrade_enabled
  settings                   = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].settings
  protected_settings         = var.resource_settings.session_pool.extension[element(keys(var.resource_settings.session_pool.extension), count.index % length(var.resource_settings.session_pool.extension))].protected_settings
}
