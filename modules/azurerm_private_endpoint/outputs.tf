output "private_endpoint_ids" {
  description = "IDs of the deployed Private Endpoints"
  value       = { for k, v in azurerm_private_endpoint.pe : k => v.id }
}
