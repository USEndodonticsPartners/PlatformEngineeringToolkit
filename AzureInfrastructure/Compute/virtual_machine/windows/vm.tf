resource "azurerm_windows_virtual_machine" "this" {
  name                  = module.naming.virtual_machine.name_unique
  resource_group_name   = var.resource_settings.resource_group_name
  location              = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  size                  = var.resource_settings.size
  admin_username        = var.resource_settings.admin_username
  admin_password        = var.resource_settings.admin_password
  network_interface_ids = var.resource_settings.network_interface_ids
  tags                  = local.tags

  os_disk {
    storage_account_type      = var.resource_settings.os_disk.storage_account_type
    caching                   = var.resource_settings.os_disk.caching
  }

  source_image_reference {
      publisher = var.resource_settings.source_image_ref.publisher
      offer     = var.resource_settings.source_image_ref.offer
      sku       = var.resource_settings.source_image_ref.sku
      version   = var.resource_settings.source_image_ref.version
  }
}
