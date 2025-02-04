resource "azurerm_route_table" "this" {
  name                = var.resource_settings.name
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name

  dynamic "route" {
    for_each = var.resource_settings.routes

    content {
      name           = route.value["name"]
      address_prefix = route.value["address_prefix"]
      next_hop_type  = route.value["next_hop_type"]
    }
  }

  tags = local.tags

  depends_on = [
    module.naming,
    module.tagging,
  ]
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = var.resource_settings.subnet_ids

  subnet_id      = each.value
  route_table_id = azurerm_route_table.this.id
}
