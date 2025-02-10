resource "azurerm_managed_disk" "this" {
  for_each = var.resource_settings.data_disks

  name                 = "${module.naming.managed_disk.name}-${each.value.name}"
  location             = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name  = var.resource_settings.resource_group_name
  storage_account_type = each.value.account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size

  tags = local.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  for_each = var.resource_settings.data_disks

  managed_disk_id    = azurerm_managed_disk.this[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  lun                = each.value.lun
  caching            = each.value.caching
}
