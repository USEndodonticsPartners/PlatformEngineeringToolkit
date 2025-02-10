resource "azurerm_windows_virtual_machine" "this" {
  name                         = module.naming.virtual_machine.name_unique
  computer_name                = azurerm_Windows_virtual_machine.this.name
  resource_group_name          = var.resource_settings.resource_group_name
  location                     = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  network_interface_ids        = var.resource_settings.network_interface_ids
  size                         = var.resource_settings.size
  admin_username               = var.resource_settings.username
  admin_password               = var.resource_settings.password
  source_image_id              = var.resource_settings.source_image_id != null ? var.resource_settings.source_image_id : null
  provision_vm_agent           = var.resource_settings.provision_agent
  allow_extension_operations   = var.resource_settings.extension_operations_enabled
  dedicated_host_id            = var.resource_settings.dedicated_host_id
  enable_automatic_updates     = var.resource_settings.automatic_updates_enabled
  license_type                 = var.resource_settings.license_type
  availability_set_id          = var.resource_settings.availability_set_enabled
  encryption_at_host_enabled   = var.resource_settings.encryption_at_host
  proximity_placement_group_id = var.resource_settings.proximity_placement_group_id
  patch_mode                   = var.resource_settings.windows_patch_mode
  patch_assessment_mode        = var.resource_settings.patch_assessment_mode
  zone                         = var.resource_settings.availability_zone
  timezone                     = var.resource_settings.timezone
  tags                         = locals.tags


  os_disk {
    name                      = var.resource_settings.os_disk.name
    storage_account_type      = var.resource_settings.os_disk.storage_account_type
    caching                   = var.resource_settings.os_disk.caching
    disk_encryption_set_id    = var.resource_settings.os_disk.disk_encryption_set_enabled
    disk_size_gb              = var.resource_settings.os_disk.size_gb
    write_accelerator_enabled = var.resource_settings.os_disk.write_accelerator_enabled
  }

  dynamic "boot_diagnostics" {
    for_each = var.resource_settings.boot_diag

    content {
      storage_account_uri = each.value.blob_endpoint
    }
  }

  dynamic "additional_capabilities" {
    for_each = var.resource_settings.addtional_capabilities

    content {
      ultra_ssd_enabled = each.value.ultra_ssd_enabled
    }
  }

  dynamic "identity" {
    for_each = var.resource_settings.identity

    content {
      type         = each.value.identity_type
      identity_ids = each.value.identity_ids
    }
  }

  dynamic "source_image_reference" {
    for_each = var.resource_settings.source_image_ref

    content {
      publisher = each.value.publisher
      offer     = each.value.offer
      sku       = each.value.sku
      version   = each.value.version
    }
  }
}
