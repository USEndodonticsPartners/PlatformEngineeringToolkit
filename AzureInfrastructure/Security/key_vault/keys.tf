resource "azurerm_key_vault_key" "this" {
  for_each = var.resource_settings.keys

  name         = "${module.naming.key_vault_key}-${each.value.name}"
  key_vault_id = azurerm_key_vault.this.id
  key_type     = each.value.type
  key_size     = each.value.size

  key_opts = each.value.key_options

  # rotation_policy {
  #   automatic {
  #     time_before_expiry = "P30D"
  #   }

  #   expire_after         = "P90D"
  #   notify_before_expiry = "P29D"
  # }
}
