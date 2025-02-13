locals {
  env_prefix = lookup(local.environments, var.global_settings.environment, "ndl")
  loc_prefix = lookup(local.prefix_locations, var.global_settings.primary_location, "ndl")

  tags = merge(var.resource_settings.tags, var.global_settings.tags)


  files_reg_script = try(file(var.resource_settings.fslogix.script), null)
  files_reg_script_b64 = base64encode(local.files_registration_script)

  # Timeout settings for resource methods
  timeouts = {
    create = "90m"
    read   = "5m"
    update = "90m"
    delete = "90m"
  }
}
