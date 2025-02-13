resource "azurerm_storage_share" "this" {
  for_each = var.resource_settings.kind == "FileStorage" ? var.resource_settings.azure_files : {}

  name               = module.naming.storage_share.name_unique
  storage_account_id = azurerm_storage_account.this.id
  quota              = each.value.quota

  depends_on = [
    azurerm_storage_account.this
  ]
}
