resource "azurerm_virtual_machine_extension" "avd_registration_script" {
  count = var.resource_settings.session_pool.count

  name                 = "register-session-host-vmext"
  virtual_machine_id   = azurerm_windows_virtual_machine.this[count.index].id
  publisher            = "Microsoft.Powershell"
  type                 = "DSC"
  type_handler_version = "2.73"

  settings = <<-SETTINGS
      {
        "modulesUrl": https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_01-19-2023.zip,
        "configurationFunction": "Configuration.ps1\\AddSessionHost",
        "properties": {
          "hostPoolName": "${azurerm_virtual_desktop_host_pool.this.name}",
          "aadjoin": true
        }
      }
      SETTINGS

  protected_settings = <<-PROTECTED_SETTINGS
      {
        "properties": {
          "registrationInfoToken": "${azurerm_virtual_desktop_host_pool_registration_info.this.token}"
        }
      }
      PROTECTED_SETTINGS

  lifecycle {
    ignore_changes = [settings, protected_settings]
  }

  depends_on = []
}
