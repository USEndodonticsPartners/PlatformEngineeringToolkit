output "storage_account_uri" {
  value = azurerm_storage_account.this.id
}

output "storage_account_uri" {
  value = azurerm_storage_account.this.primary_blob_endpoint
}

output "storage_account_file_share" {
  value = azurerm_storage_share.this.id
}
