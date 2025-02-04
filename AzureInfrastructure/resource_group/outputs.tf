output "resource_group_id" {
  value       = try(azurerm_resource_group.this.id, null)
  description = "The ID of the Resource Group."
}

output "resource_group_name" {
  value       = try(azurerm_resource_group.this.name, null)
  description = "The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}

output "resource_group_location" {
  value       = try(azurerm_resource_group.this.location, null)
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}
