param webAppName string = uniqueString(resourceGroup().id)
param sku string = 'F1'
param linuxFxVersion string = 'node|24-lts'
param location string = resourceGroup().location
param repositoryUrl string = 'https://github.com/kevin-nield/Project-4'
param branch string = 'main'
var appServicePlanName = toLower('AppServicePlan-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2025-03-01' = {
  name: appServicePlanName
  location: location
  sku: sku


}
