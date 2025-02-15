resource "azurerm_network_interface" "this" {
  count = var.resource_settings.session_pool.count

  name                = "${module.naming.network_interface.name_unique}-${count.index}"
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
  zone                  = var.resource_settings.session_pool.zone
  admin_username        = var.resource_settings.session_pool.admin_username
  admin_password        = random_password.this[count.index].result
  network_interface_ids = [azurerm_network_interface.this[count.index].id]
  computer_name         = "${var.resource_settings.session_pool.computer_name}-${count.index}"
  provision_vm_agent    = true
  vtpm_enabled          = var.resource_settings.session_pool.vtpm_enabled
  secure_boot_enabled   = var.resource_settings.session_pool.secure_boot_enabled
  timezone              = var.resource_settings.session_pool.timezone

  os_disk {
    caching              = var.resource_settings.session_pool.os_disk.caching
    storage_account_type = var.resource_settings.session_pool.os_disk.storage_type
    disk_size_gb         = var.resource_settings.session_pool.os_disk.disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  boot_diagnostics {
    storage_account_uri = var.resource_settings.session_pool.storage_account_uri # Passing a null value will utilize a Managed Storage Account to store Boot Diagnostics
  }

  source_image_reference {
    publisher = var.resource_settings.session_pool.source_image_ref.publisher
    offer     = var.resource_settings.session_pool.source_image_ref.offer
    sku       = var.resource_settings.session_pool.source_image_ref.sku
    version   = var.resource_settings.session_pool.source_image_ref.version
  }

  depends_on = [
    azurerm_virtual_desktop_host_pool.this,
    azurerm_network_interface.this
  ]
}
