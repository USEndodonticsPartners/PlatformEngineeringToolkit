locals {
  global_tags = {
    # Cloud Metadata Constants
    Author         = "SDP Terraform Services"
    Platform_Owner = "SDP Platform Engineering"


    # Cloud Environment Configurations
    Environment         = var.global_settings.environment
    Business_Unit       = var.global_settings.business_unit
    Primary_Location    = var.global_settings.primary_location
    Secondary_Location  = var.global_settings.secondary_location == null ? "None" : var.global_settings.secondary_location
    Development_Testing = var.global_settings.environment == "devtst" ? "True" : "False"
  }
}
