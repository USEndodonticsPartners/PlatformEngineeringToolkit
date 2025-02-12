# resource "azurerm_virtual_machine_extension" "avd_registration_script" {
#   count                = var.resource_settings.session_host.count
#   name                 = "RegisterAVDSessionHost"
#   virtual_machine_id   = azurerm_windows_virtual_machine.this[count.index].id # Attach to first VM
#   publisher            = "Microsoft.Compute"
#   type                 = "CustomScriptExtension"
#   type_handler_version = "1.10"

#   settings = <<SETTINGS
#     {
#       "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File C:\\AzureAVDRegister.ps1"
#     }
#   SETTINGS

#   protected_settings = <<PROTECTED_SETTINGS
#     {
#       "storageAccountName": "",
#       "storageAccountKey": "",
#       "storageContainerName": "",
#       "fileUris": ["https://raw.githubusercontent.com/your-repo/AzureAVDRegister.ps1"],
#       "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File AzureAVDRegister.ps1 -RegToken '${azurerm_virtual_desktop_host_pool_registration_info.avd_token.token}'"
#     }
#   PROTECTED_SETTINGS
# }
