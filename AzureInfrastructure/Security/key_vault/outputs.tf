output "key_vault_id" {
  value       = try(azurerm_key_vault.this.id, null)
  description = "The id of the new key vault deployment."
}
