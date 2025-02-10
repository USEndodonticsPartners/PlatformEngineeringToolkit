resource "azurerm_managed_disk" "this" {
  name                 = module.naming.managed_disk.name_unique
  location             = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name  = var.resource_settings.resource_group_name
  storage_account_type = var.resource_settings.account_type
  create_option        = var.resource_settings.create_option
  disk_size_gb         = var.resource_settings.disk_size
  tier                 = var.resource_settings.tier

  image_reference_id         = var.resource_settings.create_option == "FromImage" ? var.resource_settings.image_reference_id : null
  gallery_image_reference_id = var.resource_settings.create_option == "FromImage" ? var.resource_settings.gallery_image_reference_id : null
  os_type                    = var.resource_settings.create_option == "Copy" || var.resource_settings.create_option == "Import" || var.resource_settings.create_option == "ImportSecure" ? var.resource_settings.os_type : null
  source_uri                 = var.resource_settings.create_option == "Import" || var.resource_settings.create_option == "ImportSecure" ? var.resource_settings.source_uri : ""
  source_resource_id         = var.resource_settings.create_option == "Copy" ? var.resource_settings.source_disk_id : ""

  tags = local.tags
}
