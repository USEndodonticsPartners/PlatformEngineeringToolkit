resource "azurerm_network_interface" "this" {
  count               = var.resource_settings.session_host.count
  name                = module.naming.network_interface.name_unique
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.session_pool.resource_group_name

  ip_configuration {
    name                          = var.resource_settings.session_pool.ip_configuration.name
    subnet_id                     = var.resource_settings.session_pool.ip_configuration.subnet_id
    private_ip_address_allocation = var.resource_settings.session_pool.ip_configuration.allocation
  }
}

resource "azurerm_windows_virtual_machine" "this" {
  count               =  var.resource_settings.session_host.count
  name                = module.naming.virtual_machine.name_unique
  resource_group_name = var.resource_settings.session_pool.resource_group_name
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  size                = var.resource_settings.session_pool.vm_size
  admin_username      = var.resource_settings.session_pool.admin_username
  admin_password      = var.resource_settings.session_pool.admin_password
  network_interface_ids = [azurerm_network_interface.this[count.index].id]

  os_disk {
    caching              = var.resource_settings.session_pool.os_disk.caching
    storage_account_type = var.resource_settings.session_pool.os_disk.storage_type
  }

  source_image_reference {
    publisher = var.resource_settings.session_pool.image_reference.publisher
    offer     = var.resource_settings.session_pool.image_reference.offer
    sku       = var.resource_settings.session_pool.image_reference.sku
    version   = var.resource_settings.session_pool.image_reference.version
  }
}
