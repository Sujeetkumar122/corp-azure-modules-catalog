@description('Name of the Virtual Machine Scale Set')
param name string

@description('Azure region for the VMSS')
param location string

@description('VMSS SKU name')
param skuName string = 'Standard_B2s'

@description('Instance count')
param instanceCount int = 2

@description('Admin username')
param adminUsername string = 'azureuser'

@description('Admin password')
@secure()
param adminPassword string

@description('Subnet ID')
param subnetId string

@description('Optional Load Balancer Backend Address Pool ID to attach')
param loadBalancerBackendPoolId string = ''

@description('Resource tags')
param tags object = {}

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: skuName
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    overprovision: false
    upgradePolicy: {
      mode: 'Manual'
    }
    virtualMachineProfile: {
      osProfile: {
        computerNamePrefix: name
        adminUsername: adminUsername
        adminPassword: adminPassword
        linuxConfiguration: {
          disablePasswordAuthentication: false
        }
      }
      storageProfile: {
        imageReference: {
          publisher: 'Canonical'
          offer: '0001-com-ubuntu-server-jammy'
          sku: '22_04-lts'
          version: 'latest'
        }
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'Standard_LRS'
          }
        }
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: '${name}-nic'
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: 'ipconfig1'
                  properties: {
                    subnet: {
                      id: subnetId
                    }
                    loadBalancerBackendAddressPools: !empty(loadBalancerBackendPoolId) ? [
                      {
                        id: loadBalancerBackendPoolId
                      }
                    ] : null
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}

output id string = vmss.id
output name string = vmss.name
