resource "azurerm_virtual_machine_extension" "aad_login" {
  count = var.resource_settings.session_pool.count

  name                 = "AADLogin"
  virtual_machine_id   = azurerm_windows_virtual_machine.this[count.index].id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADLoginForWindows"
  type_handler_version = "2.2"

  depends_on = [
    azurerm_virtual_machine_extension.integrity_monitor_this,
    azurerm_virtual_machine_extension.pool_register_this,
    azurerm_windows_virtual_machine.this
  ]
}
