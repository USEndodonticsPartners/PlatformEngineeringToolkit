resource "azurerm_network_interface" "this" {
  name                = "${module.naming.network_interface.name}-${var.resource_settings.name}"
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name

  ip_configuration {
    name                          = var.resource_settings.ip_configuration.name
    private_ip_address_version    = var.resource_settings.ip_configuration.vip_address_version
    subnet_id                     = var.resource_settings.ip_configuration.vip_address_version == "IPv4" ? var.resource_settings.ip_configuration.subnet_id : ""
    private_ip_address_allocation = var.resource_settings.ip_configuration.vip_allocation
    public_ip_address_id          = var.resource_settings.ip_configuration.public_ip_enabled ? var.resource_settings.ip_configuration.pip_id : ""
    private_ip_address            = var.resource_settings.ip_configuration.vip_allocation == "Static" ? var.resource_settings.ip_configuration.private_ip_address : ""
  }

  tags = local.tags

  timeouts {
    create = local.timeouts.create
    read   = local.timeouts.read
    update = local.timeouts.update
    delete = local.timeouts.delete
  }
}
