# Corporate Azure Bicep Modules Catalog

## Overview
This repository serves as the centralized, enterprise-grade **Azure Bicep Reusable Modules Catalog**. It provides production-tested, hardened infrastructure modules implementing Cloud Adoption Framework (CAF) standards, built with strict typing, native loops (`[for ...]`), and automated Azure DevOps CI/CD validation.

## Module Registry
```text
corp-azure-modules-catalog/
├── .gitignore
├── azure-pipelines.yml             # Azure DevOps CI/CD validation & lint pipeline
├── bicepconfig.json                # Enterprise Bicep linter & security policy
├── README.md                       # Architecture & usage documentation
└── modules/
    ├── applicationGateway.bicep    # Front Gate Application Gateway (WAF_v2)
    ├── keyVault.bicep              # Key Vault with RBAC, purge protection & soft delete
    ├── linuxVirtualMachine.bicep   # Linux VM with OS disk and LB attachment
    ├── linuxVirtualMachineScaleSet.bicep # Linux VMSS for autoscaling compute tiers
    ├── loadBalancer.bicep          # Public & Internal Standard Load Balancers
    ├── networkSecurityGroup.bicep  # NSG with dynamic security rule loops
    ├── privateEndpoint.bicep       # Private Link endpoints for zero-trust security
    ├── publicIp.bicep              # Standard Static Public IP addresses
    ├── resourceGroup.bicep         # Subscription-scoped Resource Group creation
    └── virtualNetwork.bicep        # Hub/Spoke VNets with subnets and NSG associations
```

## Security & Compliance
- **Zero-Trust**: Key Vault modules enforce `publicNetworkAccess: 'Disabled'` with Private Endpoint links.
- **WAF Protection**: Application Gateway configured with `WAF_v2` tier.
- **Enterprise Linter**: Governed via `bicepconfig.json` with errors for unsecure secrets and unused parameters.
- **Multi-Stage CI/CD**: Automated linting and compilation via `azure-pipelines.yml`.
