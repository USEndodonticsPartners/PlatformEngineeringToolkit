resource "azurerm_storage_account" "this" {
  name                          = module.naming.storage_account.name_unique
  resource_group_name           = var.resource_settings.resource_group_name
  location                      = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  access_tier                   = var.resource_settings.access_tier
  account_kind                  = var.resource_settings.kind
  account_tier                  = var.resource_settings.tier
  account_replication_type      = var.resource_settings.replication_type
  https_traffic_only_enabled    = var.resource_settings.https_only_enabled
  min_tls_version               = var.resource_settings.min_tls_version
  public_network_access_enabled = var.resource_settings.public_access_enabled
  is_hns_enabled                = var.resource_settings.hns_enabled
  nfsv3_enabled                 = var.resource_settings.nfsv3_enabled
  tags                          = local.tags

  dynamic "network_rules" {
    for_each = var.resource_settings.network_rules

    content {
      bypass                     = network_rules.value.bypass
      default_action             = network_rules.value.default_action
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.subnet_ids

      private_link_access {
        endpoint_resource_id = network_rules.value.private_link.resource_id
        endpoint_tenant_id   = network_rules.value.private_link.tenant_id
      }
    }
  }

  azure_files_authentication {
    directory_type                 = var.resource_settings.azure_files_authentication.directory_type
    default_share_level_permission = var.resource_settings.azure_files_authentication.default_share_level_permissions
  }

  # blob_properties {
  #   versioning_enabled            = var.resource_settings.blob_properties.versioning_enabled
  #   change_feed_enabled           = var.resource_settings.blob_properties.change_feed_enabled
  #   change_feed_retention_in_days = var.resource_settings.blob_properties.change_feed_retention
  #   last_access_time_enabled      = var.resource_settings.blob_properties.last_access_time_enabled
  #   default_service_version       = var.resource_settings.blob_properties.default_service_version

  #   container_delete_retention_policy {
  #     days = var.resource_settings.blob_properties.container_delete_retention_policy.days
  #   }

  #   cors_rule {
  #     allowed_headers    = var.resource_settings.blob_properties.cors_rule.allowed_headers
  #     allowed_methods    = var.resource_settings.blob_properties.cors_rule.allowed_methods
  #     allowed_origins    = var.resource_settings.blob_properties.cors_rule.allowed_origins
  #     exposed_headers    = var.resource_settings.blob_properties.cors_rule.exposed_headers
  #     max_age_in_seconds = var.resource_settings.blob_properties.cors_rule.max_age_in_sec
  #   }

  #   delete_retention_policy {
  #     days                     = var.resource_settings.blob_properties.delete_retention_policy.days
  #     permanent_delete_enabled = var.resource_settings.blob_properties.delete_retention_policy.permanent_delete_enabled
  #   }
  # }

  # customer_managed_key {
  #   key_vault_key_id          = var.resource_settings.cmk.key_id
  #   managed_hsm_key_id        = var.resource_settings.cmk.hsm_key_id
  #   user_assigned_identity_id = var.resource_settings.cmk.user_assigned_id
  # }

  # custom_domain {
  #   name          = var.resource_settings.custom_domain.name
  #   use_subdomain = var.resource_settings.custom_domain.subdomain_enabled
  # }

  # identity {
  #   type         = var.resource_settings.identity.type
  #   identity_ids = var.resource_settings.identity.identity_ids
  # }

  # routing {
  #   publish_internet_endpoints  = var.resource_settings.routing.internet_publishing
  #   publish_microsoft_endpoints = var.resource_settings.routing.microsoft_publishing
  #   choice                      = var.resource_settings.routing.choice
  # }
}
