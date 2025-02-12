resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "this" {
  name         = "${azurerm_windows_virtual_machine.this.name}-password"
  value        = random_password.this.result
  key_vault_id = var.resource_settings.session_pool.key_vault_id
}
