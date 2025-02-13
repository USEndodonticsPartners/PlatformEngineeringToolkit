# resource "azurerm_virtual_machine_extension" "fsLogix-this" {
#   name                 = "sample-hostname"
#   virtual_machine_id   = azurerm_windows_virtual_machine.avd_vm.id
#   publisher            = "Microsoft.Powershell"
#   type                 = "DSC"
#   type_handler_version = "2.73"

#   settings = <<SETTINGS
#       {
#       "commandToExecute": "powershell fileshare.ps1"
#       }
#   SETTINGS

#   tags = {
#     environment = "Production"
#   }

#   lifecycle {
#     ignore_changes = [settings, protected_settings]
#   }

#   depends_on = []
# }
