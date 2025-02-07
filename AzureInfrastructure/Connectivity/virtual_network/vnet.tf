resource "azurerm_virtual_network" "this" {
  name                = "${module.naming.virtual_network.name}-${var.resource_settings.name}"
  location            = lookup(local.azure_locations, var.global_settings.primary_location, "ndl")
  resource_group_name = var.resource_settings.resource_group_name
  address_space       = var.resource_settings.address_space
  dns_servers         = var.resource_settings.dns_servers

  dynamic "subnet" {
    for_each = var.resource_settings.subnets

    content {
      name                              = subnet.value["name"]
      address_prefixes                  = subnet.value["address_prefixes"]
      security_group                    = subnet.value["security_group_id"]
      default_outbound_access_enabled   = subnet.value["default_outbound_access"]
      private_endpoint_network_policies = subnet.value["private_endpoint_policy"]
      service_endpoints                 = subnet.value["service_endpoints"]
      service_endpoint_policy_ids       = subnet.value["service_endpoint_policy_ids"]

      dynamic "delegation" {
        for_each = subnet.value["delegation"]

        content {
          name = delegation.value["name"]

          dynamic "service_delegation" {
            for_each = delegation.value["service_delegation"]

            content {
              name    = service_delegation.value["name"]
              actions = serice_delegation.value["actions"]
            }
          }
        }
      }
    }
  }

  dynamic "encryption" {
    for_each = var.resource_settings.encryption != null ? ["encryption"] : []

    content {
      enforcement = var.resource_settings.encryption.enforcement
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = var.resource_settings.ddos != null ? ["ddos_protection_plan"] : []

    content {
      id     = var.resource_settings.ddos.id
      enable = true
    }
  }

  timeouts {
    create = local.timeouts.create
    read   = local.timeouts.read
    update = local.timeouts.update
    delete = local.timeouts.delete
  }

  tags = merge(local.tags, var.resource_settings.tags)

  depends_on = [
    module.naming,
    module.tagging
  ]

  lifecycle {
      prevent_destroy = true
    }

}
