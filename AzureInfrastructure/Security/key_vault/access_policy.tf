resource "azurerm_key_vault_access_policy" "this" {
  for_each = var.resource_settings.access_policies

  object_id    = each.value.object_id
  tenant_id    = each.value.tenant_id
  key_vault_id = azurerm_key_vault.this.id

  key_permissions = each.value.key_permissions

  secret_permissions = each.value.secret_permissions

  certificate_permissions = each.value.certificate_permissions
}
