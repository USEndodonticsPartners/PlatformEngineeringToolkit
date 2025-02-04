locals {
  env_prefix = lookup(local.environments, var.global_settings.environment, "ndl")
  loc_prefix = lookup(local.prefix_locations, var.global_settings.primary_location, "ndl")
}
