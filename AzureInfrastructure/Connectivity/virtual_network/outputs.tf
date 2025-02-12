output "virtual_network_id" {
  value = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.this.name
}

output "virtual_network_address_space" {
  value = azurerm_virtual_network.this.address_space
}

output "virtual_network_location" {
  value = azurerm_virtual_network.this.location
}

output "virtual_network_guid" {
  value = azurerm_virtual_network.this.guid
}

output "subnets" {
  value = azurerm_subnet.this[each.key].id
}
