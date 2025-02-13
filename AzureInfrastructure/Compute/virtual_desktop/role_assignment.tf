resource "azurerm_role_assignment" "this" {
  count = var.resource_settings.session_pool.count

  scope                = azurerm_windows_virtual_machine.this[count.index].id
  role_definition_name = "Virtual Machine User Login"
  principal_id         = azurerm_windows_virtual_machine.this[count.index].identity.principal_id
}
