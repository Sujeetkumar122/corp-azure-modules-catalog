@description('Name of the Key Vault')
param name string

@description('Azure region for the Key Vault')
param location string

@description('SKU name')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Soft delete retention in days')
param softDeleteRetentionInDays int = 7

@description('Enable purge protection')
param enablePurgeProtection bool = true

@description('Array of secrets to create: [{ name: "secret1", value: "val1" }]')
param secrets array = []

@description('Resource tags')
param tags object = {}

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: skuName
    }
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: softDeleteRetentionInDays
    enablePurgeProtection: enablePurgeProtection ? true : null
    publicNetworkAccess: 'Disabled'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
  }
}

resource kvSecrets 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = [for secret in secrets: {
  parent: kv
  name: secret.name
  properties: {
    value: secret.value
  }
}]

output id string = kv.id
output name string = kv.name
output vaultUri string = kv.properties.vaultUri
