locals {
  # Holds the resource specific tags for automated association
  tags = merge(module.tagging.global_tags, var.global_settings.global_tags)

  # Ensures that all production workloads are readonly to prevent mistaken deletion
  prod_lock_notes = "Allows ReadOnly access to all production resources"

  # Timeout settings for resource methods
  timeouts = {
    create = "90m"
    read   = "5m"
    update = "90m"
    delete = "90m"
  }
}
