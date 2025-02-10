resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  for_each = var.resoure_settings.data_disks

  managed_disk_id    = each.value.id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id
  lun                = each.value.lun
  caching            = each.value.caching
}
