resource "azurerm_virtual_machine_extension" "aad_join" {
  count = var.resource_settings.session_host.count
  name                 = "AADJoin"
  virtual_machine_id   = azurerm_windows_virtual_machine.this[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File C:\\AzureADJoin.ps1"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "fileUris": ["https://yourstorageaccount.blob.core.windows.net/avd-scripts/AzureADJoin.ps1?<SAS-Token>"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File AzureADJoin.ps1"
    }
  PROTECTED_SETTINGS
}
