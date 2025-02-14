resource "azurerm_virtual_desktop_scaling_plan" "this" {
  name                = module.naming.virtual_desktop_scaling_plan.name
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  description         = var.resource_settings.scaling_plan.description
  friendly_name       = var.resource_settings.scaling_plan.friendly_name
  time_zone           = var.resource_settings.scaling_plan.time_zone # Change as needed

  host_pool {
    hostpool_id          = azurerm_virtual_desktop_host_pool.this.id
    scaling_plan_enabled = var.resource_settings.scaling_plan.enabled
  }

  schedule {
    name                                 = var.resource_settings.scaling_plan.schedule.name
    days_of_week                         = var.resource_settings.scaling_plan.schedule.days_of_week
    off_peak_start_time                  = var.resource_settings.scaling_plan.schedule.off_peak.start_time
    off_peak_load_balancing_algorithm    = var.resource_settings.scaling_plan.schedule.off_peak.load_balancer_algo
    ramp_up_start_time                   = var.resource_settings.scaling_plan.schedule.ramp_up.start_time
    ramp_up_capacity_threshold_percent   = var.resource_settings.scaling_plan.schedule.ramp_up.capacity_threshold_percent
    ramp_up_load_balancing_algorithm     = var.resource_settings.scaling_plan.schedule.ramp_up.load_balancing_algo
    ramp_up_minimum_hosts_percent        = var.resource_settings.scaling_plan.schedule.ramp_up.min_hosts_percent
    peak_start_time                      = var.resource_settings.scaling_plan.schedule.peak.start_time
    peak_load_balancing_algorithm        = var.resource_settings.scaling_plan.schedule.peak.load_balancing_algo
    ramp_down_start_time                 = var.resource_settings.scaling_plan.schedule.ramp_down.start_time
    ramp_down_stop_hosts_when            = var.resource_settings.scaling_plan.schedule.ramp_down.stop_hosts_when
    ramp_down_wait_time_minutes          = var.resource_settings.scaling_plan.schedule.ramp_down.wait_time_mins
    ramp_down_capacity_threshold_percent = var.resource_settings.scaling_plan.schedule.ramp_down.capacity_threshold_percent
    ramp_down_load_balancing_algorithm   = var.resource_settings.scaling_plan.schedule.ramp_down.load_balancing_algo
    ramp_down_notification_message       = var.resource_settings.scaling_plan.schedule.ramp_down.notification_message
    ramp_down_minimum_hosts_percent      = var.resource_settings.scaling_plan.schedule.ramp_down.min_hosts_percent
    ramp_down_force_logoff_users         = var.resource_settings.scaling_plan.schedule.ramp_down.force_logoff_users
  }
}

resource "azurerm_virtual_desktop_scaling_plan_host_pool_association" "this" {
  enabled         = var.resource_settings.scaling_plan.enabled
  scaling_plan_id = azurerm_virtual_desktop_scaling_plan.this.id
  host_pool_id    = azurerm_virtual_desktop_host_pool.this.id
}
