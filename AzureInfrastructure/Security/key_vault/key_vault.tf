data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                            = module.naming.key_vault.name
  location                        = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name             = var.resource_settings.resource_group_name
  enabled_for_disk_encryption     = var.resource_settings.enabled_for_disk_encryption
  tenant_id                       = var.resource_settings.tenant_id
  purge_protection_enabled        = var.resource_settings.purge_protection_enabled
  soft_delete_retention_days      = var.resource_settings.soft_delete_retention_days
  enable_rbac_authorization       = var.resource_settings.rbac_authorization_enabled
  public_network_access_enabled   = var.resource_settings.public_network_access_enabled
  sku_name                        = var.resource_settings.sku
  enabled_for_deployment          = var.resource_settings.deployment_enabled
  enabled_for_template_deployment = var.resource_settings.template_deployment_enabled
  tags                            = local.tags

  access_policy {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = data.azurerm_client_config.current.object_id

      key_permissions = [
        "Get",
      ]

      secret_permissions = [
        "Get",
        "List",
        "Set",
        "Recover"
      ]

      storage_permissions = [
        "Get",
      ]
    }

  dynamic "network_acls" {
    for_each = var.resource_settings.network_acls
    iterator = acl

    content {
      bypass                     = acl.value.bypass
      default_action             = acl.value.default_action
      ip_rules                   = acl.value.ip_rules
      virtual_network_subnet_ids = acl.value.subnet_ids
    }
  }
}
