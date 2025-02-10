output "network_interface_id" {
  value       = try(azurerm_network_interface.this.id, null)
  description = "The ID of the Resource Group."
}

output "network_interface_vip" {
  value       = try(azurerm_network_interface.this.private_ip_address, null)
  description = "The ID of the Resource Group."
}

output "network_interface_vm_id" {
  value       = try(azurerm_network_interface.this.virtual_machine_id, null)
  description = "The ID of the Resource Group."
}
