variable "global_settings" {
  type = any
}

variable "resource_settings" {
  type = object({
    name                       = string
    resource_group_name        = string
    account_type               = optional(string, "Standard_LRS")
    create_option              = optional(string, "Empty")
    disk_size                  = optional(number, 512)
    tier                       = optional(string, "")
    image_reference_id         = optional(string)
    gallery_image_reference_id = optional(string)
    source_uri                 = optional(string)
    os_type                    = optional(string)
    metadata                   = any
  })
}
