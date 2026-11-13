variable "private_endpoints" {
  description = "Map of private endpoints to configure"
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    subnet_id                      = string
    private_connection_resource_id = string
    subresource_names              = list(string)
    is_manual_connection           = optional(bool, false)
    tags                           = optional(map(string), {})
  }))
}
