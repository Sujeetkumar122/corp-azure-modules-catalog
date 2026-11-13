output "virtual_machine_ids" {
  description = "IDs of the deployed Virtual Machines"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "nic_ids" {
  description = "IDs of the created NICs"
  value       = { for k, v in azurerm_network_interface.nic : k => v.id }
}

output "private_ip_addresses" {
  description = "Private IP addresses of the VMs"
  value       = { for k, v in azurerm_network_interface.nic : k => v.private_ip_address }
}
