resource "azurerm_network_security_group" "this" {
  name                = module.naming.network_security_group.name
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name

  dynamic "security_rule" {
    for_each = var.resource_settings.security_rules

    content {
      name                       = "${module.naming.network_security_group_rule.name}-${security_rule.value["name"]}"
      priority                   = security_rule.value["priority"]
      direction                  = security_rule.value["direction"]
      access                     = security_rule.value["access"]
      protocol                   = security_rule.value["protocol"]
      source_port_range          = security_rule.value["source_port_range"]
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }

  tags = local.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each                  = var.resource_settings.subnet_ids

  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.this.id
}
