resource "azurerm_storage_share" "this" {
  for_each = var.resource_settings.azure_file_shares

  name               = each.value.share_name
  storage_account_id = azurerm_storage_account.this.id
  quota              = each.value.quota

  depends_on = [
    azurerm_storage_account.this
  ]
}
