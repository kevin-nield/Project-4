/*
NOTE: App Service Plan moved to a module

This file is deployed at the *subscription scope* (targetScope = 'subscription')
so it can create the resource group.

In Bicep, resources at different scopes cannot be cleanly mixed in a single file.
To deploy resources *into* a resource group that is created in this same deployment,
we must use a module and set its scope to the RG.

Pattern used:
- main.bicep (subscription scope) → creates RG
- module (resource-group scope) → deploys resources into that RG

This follows the standard cross-scope deployment pattern and keeps concerns separated:
- RG lifecycle at subscription level
- Resource deployment at RG level

Also makes the RG reusable for other modules later.
*/

targetScope = 'subscription'

param rgName string = 'rg-project4-dev'
param location string = 'westus2'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module app './modules/appServicePlan.bicep' = {
  name: 'appServicePlanDeploy'
  scope: rg
  params: {location: location}
}
