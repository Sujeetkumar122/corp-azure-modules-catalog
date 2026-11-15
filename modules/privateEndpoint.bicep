@description('Name of the Private Endpoint')
param name string

@description('Azure region for the Private Endpoint')
param location string

@description('Subnet ID where Private Endpoint will be created')
param subnetId string

@description('Target resource ID to connect to')
param privateLinkServiceId string

@description('Group IDs / Subresource names, e.g. ["vault"]')
param groupIds array

@description('Resource tags')
param tags object = {}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: '${name}-conn'
        properties: {
          privateLinkServiceId: privateLinkServiceId
          groupIds: groupIds
        }
      }
    ]
  }
}

output id string = privateEndpoint.id
output name string = privateEndpoint.name
output networkInterfaceId string = privateEndpoint.properties.networkInterfaces[0].id
