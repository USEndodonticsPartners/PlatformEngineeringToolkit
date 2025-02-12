resource "azurerm_network_interface" "this" {
  count               = var.resource_settings.session_pool.count
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
  count = var.resource_settings.session_pool.count

  name                  = "${module.naming.virtual_machine.name_unique}-${count.index}"
  resource_group_name   = var.resource_settings.session_pool.resource_group_name
  location              = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  size                  = var.resource_settings.session_pool.vm_size
  admin_username        = var.resource_settings.session_pool.admin_username
  admin_password        = random_password.this.result
  network_interface_ids = [azurerm_network_interface.this[count.index].id]
  computer_name         = "${var.resource_settings.session_pool.computer_name}${count.index}}"

  os_disk {
    caching              = var.resource_settings.session_pool.os_disk.caching
    storage_account_type = var.resource_settings.session_pool.os_disk.storage_type
  }

  source_image_reference {
    publisher = var.resource_settings.session_pool.source_image_ref.publisher
    offer     = var.resource_settings.session_pool.source_image_ref.offer
    sku       = var.resource_settings.session_pool.source_image_ref.sku
    version   = var.resource_settings.session_pool.source_image_ref.version
  }
}
