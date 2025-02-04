locals {
  env_prefix = lookup(local.environments, var.global_settings.environment, "ndl")
  loc_prefix = lookup(local.prefix_locations, var.global_settings.primary_location, "ndl")

  tags = merge(module.tagging.group_tags, var.global_settings.tags)

  # Timeout settings for resource methods
  timeouts = {
    create = "90m"
    read   = "5m"
    update = "90m"
    delete = "90m"
  }
}
