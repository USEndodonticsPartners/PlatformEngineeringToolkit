resource "azurerm_virtual_machine_extension" "integrity_monitor_this" {
  count = var.resource_settings.session_pool.count
  name                 = "GuestAttestationExtension"
  virtual_machine_id   = azurerm_windows_virtual_machine.this[count.index].id
  publisher            = "Microsoft.Azure.Security.WindowsAttestation"
  type                 = "GuestAttestation"
  type_handler_version = "1.0"

  settings = <<-SETTINGS
  {
    auto_upgrade_minor_version = true
    enableAutomaticUpgrade = true
    settings = "{
      "AttestationConfig": {
      "MaaSettings": {
        "maaEndpoint": "",
        "maaTenantName": "GuestAttestation"
        },
      "AscSettings": {
        "ascReportingEndpoint": "",
        "ascReportingFrequency": ""
        },
      "useCustomToken": "false",
      "disableAlerts": "false"
    }
  }
  SETTINGS

  protected_settings = <<-PROTECTED_SETTINGS
      PROTECTED_SETTINGS

  lifecycle {
    ignore_changes = [settings, protected_settings]
  }

  depends_on = []
}
