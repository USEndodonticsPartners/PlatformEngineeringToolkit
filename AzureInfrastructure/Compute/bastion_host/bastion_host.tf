resource "azurerm_bastion_host" "this" {
  name                = module.naming.bastion_host.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  sku = var.resource_settings.sku

  ip_connect_enabled = var.resource_settings.configurations.ip_connect_enabled
  copy_paste_enabled = var.resource_settings.configurations.copy_paste_enabled
  scale_units = var.resource_settings.configurations.scale_units
  shareable_link_enabled = var.resource_settings.sku == "Standard" ? var.resource_settings.configurations.shareable_link_enabled : null
  file_copy_enabled = var.resource_settings.sku == "Standard" ? var.resource_settings.configurations.file_copy_enabled : null
  tunneling_enabled = var.resource_settings.sku == "Standard" ? var.resource_settings.configurations.tunneling_enabled : null

  tags = local.tags

  ip_configuration {
    name                 = var.resource_settings.ip_configurtion.name
    subnet_id            = var.resource_settings.ip_configurtion.subnet_id
    public_ip_address_id = var.resource_settings.ip_configurtion.pip_id
  }
}
