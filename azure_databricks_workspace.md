Document: "databricks"


Path: "/tmp/azure-rest-api-specs/specification/databricks/resource-manager/Microsoft.Databricks/stable/2018-04-01/databricks.json")

## Workspace

Information about workspace.

```puppet
azure_databricks_workspace {
  api_version => "api_version",
  location => "location (optional)",
  parameters => "parameters",
  properties => $azure_workspace_properties
  resource_group_name => "resource_group_name",
  sku => $azure_sku
  subscription_id => "subscription_id",
  tags => "tags (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | The API version to use for this operation. |
|location | String | false | The geo-location where the resource lives |
|parameters | Hash | true | Parameters supplied to the create or update a workspace. |
|properties | [WorkspaceProperties](#workspaceproperties) | true | The workspace properties. |
|resource_group_name | String | true | The name of the resource group. The name is case insensitive. |
|sku | [Sku](#sku) | false | The SKU of the resource. |
|subscription_id | String | true | The ID of the target subscription. |
|tags | Hash | false | Resource tags. |
        
## WorkspaceProperties

The workspace properties.

```puppet
$azure_workspace_properties = {
  authorizations => $azure_workspace_provider_authorization
  managedResourceGroupId => "managedResourceGroupId",
  parameters => "parameters (optional)",
  provisioningState => $azure_provisioning_state
  uiDefinitionUri => "uiDefinitionUri (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|authorizations | [WorkspaceProviderAuthorization](#workspaceproviderauthorization) | false | The workspace provider authorizations. |
|managedResourceGroupId | String | true | The managed resource group Id. |
|parameters | Hash | false | Name and value pairs that define the workspace parameters. |
|provisioningState | [ProvisioningState](#provisioningstate) | false | The workspace provisioning state. |
|uiDefinitionUri | String | false | The blob URI where the UI definition file is located. |
        
## WorkspaceProviderAuthorization

The workspace provider authorization.

```puppet
$azure_workspace_provider_authorization = {
  principalId => "principalId",
  roleDefinitionId => "roleDefinitionId",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|principalId | String | true | The provider's principal identifier. This is the identity that the provider will use to call ARM to manage the workspace resources. |
|roleDefinitionId | String | true | The provider's role definition identifier. This role will define all the permissions that the provider must have on the workspace's container resource group. This role definition cannot have permission to delete the resource group. |
        
## ProvisioningState

Provisioning status of the workspace.

```puppet
$azure_provisioning_state = {
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
        
## Sku

SKU for the resource.

```puppet
$azure_sku = {
  name => "name",
  tier => "tier (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|name | String | true | The SKU name. |
|tier | String | false | The SKU tier. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the Workspace

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Databricks/workspaces/%{workspace_name}`|Put|Creates a new workspace.|Workspaces_CreateOrUpdate|
|List - list all|`/subscriptions/%{subscription_id}/providers/Microsoft.Databricks/workspaces`|Get|Gets all the workspaces within a subscription.|Workspaces_ListBySubscription|
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Databricks/workspaces/%{workspace_name}`|Get|Gets the workspace.|Workspaces_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Databricks/workspaces`|Get|Gets all the workspaces within a resource group.|Workspaces_ListByResourceGroup|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Databricks/workspaces/%{workspace_name}`|Put|Creates a new workspace.|Workspaces_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Databricks/workspaces/%{workspace_name}`|Delete|Deletes the workspace.|Workspaces_Delete|
