resource "azurerm_subnet" "this" {
  for_each = var.resource_settings.subnets

  name                 = each.value.name
  resource_group_name  = var.resource_settings.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.delegation

    content {
      name = each.value.name

      dynamic "service_delegation" {
        for_each = each.value.service_delegation

        content {
          name    = each.value.name
          actions = each.value.actions
        }
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [
    azurerm_virtual_network.this
  ]
}
