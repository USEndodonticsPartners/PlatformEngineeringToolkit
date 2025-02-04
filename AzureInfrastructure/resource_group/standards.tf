module "naming" {
  source = "Azure/naming/azurerm"
  prefix = [local.env_prefix, local.loc_prefix]
}

module "tagging" {
  source          = "../../../standards/tagging_standards"
  global_settings = var.global_settings
}
