# Corporate Azure Terraform Modules Catalog

Standardized, reusable child modules library for Azure Enterprise Landing Zones.

## 📦 Included Child Modules

| Module | Resource / Service | Key Features |
| :--- | :--- | :--- |
| **`modules/azurerm_key_vault`** | Azure Key Vault & Secrets | `for_each`, RBAC/Access Policies, Soft Delete, Purge Protection |
| **`modules/azurerm_virtual_network`** | Virtual Networks & Subnets | `for_each`, Dynamic address spaces & subnet prefix mapping |
| **`modules/azurerm_public_ip`** | Public IP Addresses | `for_each`, Standard static SKUs, Zone-redundant |
| **`modules/azurerm_lb`** | Azure Load Balancer | `for_each`, Frontend IP, Backend Address Pools, Probes, Rules |
| **`modules/azurerm_application_gateway`** | Application Gateway (Front Gate) | `for_each`, WAF v2, HTTP Listeners, Backend Pools, Routing Rules |
| **`modules/azurerm_linux_virtual_machine`** | Linux Virtual Machines | `for_each`, OS disk, NIC attachment, Cloud-init |
| **`modules/azurerm_linux_virtual_machine_scale_set`** | VMSS (Scale Sets) | `for_each`, Autoscaling, Load balancer backend integration |
| **`modules/azurerm_private_endpoint`** | Private Endpoints | `for_each`, Private Link connection to PaaS services |
| **`modules/azurerm_network_security_group`** | Network Security Groups | `for_each`, Ingress/Egress security rules |

## 🛡️ Enterprise Standards
- **100% Pure HCL**: Strictly typed `map(object({...}))` input variables.
- **Dynamic Loops**: Native `for_each` on all resource blocks.
- **CIS Compliant**: Secure defaults for TLS, encryption, and network isolation.
