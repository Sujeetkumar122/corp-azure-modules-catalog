variable "nsgs" {
  description = "Map of network security groups to deploy"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
}
