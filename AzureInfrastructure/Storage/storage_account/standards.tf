module "naming" {
  source = "Azure/naming/azurerm"
  prefix = [local.env_prefix, local.loc_prefix]
  suffix = [var.resource_settings.name]
}

module "tagging" {
  source          = "../../Standards"
  global_settings = var.global_settings
}
