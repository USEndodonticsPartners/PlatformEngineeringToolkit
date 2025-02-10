output "windows_virtual_machine_id" {
  value       = try(azurerm_windows_virtual_machine.this.id, null)
  description = "The ID of the Windows Virtual Machine."
}
