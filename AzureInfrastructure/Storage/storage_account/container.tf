resource "azurerm_storage_container" "this" {
  for_each = var.resource_settings.containers

  name                     = "${module.naming.storage_container.name}-${each.key}"
  storage_account_id       = azurerm_storage_account.this.id
  container_access_type    = each.value.access_type
  default_encryption_scope = each.value.default_encryption_scope
  metadata                 = each.value.container_metadata
}
