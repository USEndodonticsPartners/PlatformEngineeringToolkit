resource "azurerm_windows_virtual_machine" "this" {
  name                  = module.naming.virtual_machine.name_unique
  resource_group_name   = var.resource_settings.resource_group_name
  location              = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  size                  = var.resource_settings.size
  admin_username        = var.resource_settings.username
  admin_password        = ""
  network_interface_ids = var.resource_settings.network_interface_ids
  availability_set_id   = ""
  tags                  = locals.tags

  os_disk {
    name                      = var.resource_settings.os_disk.name
    storage_account_type      = var.resource_settings.os_disk.storage_account_type
    caching                   = var.resource_settings.os_disk.caching
    disk_encryption_set_id    = var.resource_settings.os_disk.disk_encryption_set_enabled
    disk_size_gb              = var.resource_settings.os_disk.size_gb
    write_accelerator_enabled = var.resource_settings.os_disk.write_accelerator_enabled
  }

  dynamic "source_image_reference" {
    for_each = var.resource_settings.source_image_ref

    content {
      publisher = each.value.publisher
      offer     = each.value.offer
      sku       = each.value.sku
      version   = each.value.version
    }
  }
}
