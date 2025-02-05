###########################################################
## Azure Tagging Module Variables
###########################################################

# Required Inputs for Resource Naming Creation
# variable "site_information" {
#   type = object({
#     consolidation_id = string
#     practice_type    = string
#     stakeholder      = string
#     division         = string
#     time_zone        = string
#     city             = string
#     state            = string
#   })
#   default = {
#     consolidation_id = ""
#     practice_type    = ""
#     stakeholder      = ""
#     division         = ""
#     time_zone        = ""
#     city             = ""
#     state            = ""
#   }
# }

variable "global_settings" {
  type = object({
    environment        = string
    primary_location   = string
    secondary_location = optional(string, "none")
    tags               = map(string)
  })
  default = {
    environment        = ""
    primary_location   = ""
    secondary_location = ""
    tags               = {}
  }
}

# variable "group_settings" {
#   type = object({
#     category      = string
#     workload_type = string
#   })
#   default = {
#     category      = ""
#     workload_type = ""
#   }
# }

# variable "resource_settings" {
#   type = object({
#     vpn_enabled          = bool
#     monitoring_enabled   = bool
#     update_mgmt_enabled  = bool
#     ansible_mgmt_enabled = bool
#     backup_enabled       = bool
#     encryption_enabled   = bool
#   })
#   default = {
#     vpn_enabled          = false
#     monitoring_enabled   = false
#     update_mgmt_enabled  = false
#     ansible_mgmt_enabled = false
#     backup_enabled       = false
#     encryption_enabled   = false
#   }
# }

variable "unique-include-numbers" {
  description = "If you want to include numbers in the unique generation"
  type        = bool
  default     = true
}
