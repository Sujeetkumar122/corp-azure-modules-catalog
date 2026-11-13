output "nsg_ids" {
  description = "IDs of the deployed Network Security Groups"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}
