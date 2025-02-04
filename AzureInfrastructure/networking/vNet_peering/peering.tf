resource "azurerm_virtual_network_peering" "to-from-this" {
  name                      = "${var.resource_settings.local_network.name}-to-${var.resource_settings.remote_network.name}-peering"
  resource_group_name       = var.resource_settings.local_network.resource_group_name
  virtual_network_name      = var.resource_settings.local_network.name
  remote_virtual_network_id = var.resource_settings.remote_network.id
}

resource "azurerm_virtual_network_peering" "from-to-this" {
  name                      = "${var.resource_settings.remote_network.name}-to-${var.resource_settings.local_network.name}-peering"
  resource_group_name       = var.resource_settings.remote_network.resource_group_name
  virtual_network_name      = var.resource_settings.remote_network.name
  remote_virtual_network_id = var.resource_settings.local_network.id
}
