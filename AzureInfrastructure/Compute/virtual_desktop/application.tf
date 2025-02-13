resource "azurerm_virtual_desktop_application" "chrome" {
  for_each = var.resource_settings.applications

  name                         = each.value.name
  application_group_id         = azurerm_virtual_desktop_application_group.this.id
  friendly_name                = each.value.friendly_name
  description                  = each.value.description
  path                         = each.value.application_path
  command_line_argument_policy = each.value.cmd_arg_policy
  command_line_arguments       = each.value.cmd_args
  show_in_portal               = each.value.portal_enabled
  icon_path                    = each.value.icon_path
  icon_index                   = each.value.icon_index
}
