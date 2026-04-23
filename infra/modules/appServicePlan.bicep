param location string

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'AppServicePlan-WebApp'
  location: location
  kind: 'linux'
  sku: {
    name: 'F1'
  }
  properties: {
    reserved: true
  }
}
