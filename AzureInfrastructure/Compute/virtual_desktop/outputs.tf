output "avd_host_pool_id" {
  value = azurerm_virtual_desktop_host_pool.this.id
}

output "avd_workspace_id" {
  value = azurerm_virtual_desktop_workspace.this.id
}

output "registration_token" {
  value = azurerm_virtual_desktop_host_pool_registration_info.this.token
  sensitive = true
}
