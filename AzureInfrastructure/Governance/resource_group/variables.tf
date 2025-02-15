variable "global_settings" {
  type = object({
    primary_location   = string
    secondary_location = string
    environment        = string
    tags               = map(string)
  })
}

variable "resource_settings" {
  type = object({
    workload_name = string
    tags          = map(string)
  })
}
