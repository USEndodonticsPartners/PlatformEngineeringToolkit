# resource "azurerm_key_vault_secret" "this" {
#   for_each = var.resource_settings.secrets

#   name         = "${module.naming.key_vault_secret}-${each.value.name}"
#   value        = local.secret
#   key_vault_id = azurerm_key_vault.this.id
# }
