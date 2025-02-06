resource "azurerm_storage_blob" "this" {
  for_each = var.resource_settings.blob

  name                   = each.key
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this["${each.value.container_name}"].name
  type                   = each.value.type
  source_content         = each.value.source_type == "source_content" ? each.value.source_content : ""
  source_uri             = each.value.source_type == "source_uri" ? each.value.source_uri : ""
}
