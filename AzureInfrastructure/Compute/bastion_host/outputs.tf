output "dns_name" {
  value       = try(azurerm_bastion_host.this.dns_name, null)
  description = "Specifies the name of the bastion host."
}

output "id" {
  value       = try(azurerm_bastion_host.this.id, null)
  description = "Specifies the resource id of the bastion host."
}
