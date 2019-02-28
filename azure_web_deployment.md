Document: "service"


Path: "/tmp/azure-rest-api-specs/specification/web/resource-manager/Microsoft.Web/stable/2015-08-01/service.json")

## Deployment

Represents user credentials used for publishing activity

```puppet
azure_web_deployment {
  api_version => "api_version",
  deployment => "deployment",
  id => "id (optional)",
  kind => "kind (optional)",
  location => "location (optional)",
  name => "name (optional)",
  properties => "properties (optional)",
  resource_group_name => "resource_group_name",
  slot => "slot",
  subscription_id => "subscription_id",
  tags => "tags (optional)",
  type => "type (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | API Version |
|deployment | Hash | true | Details of deployment |
|id | String | false | Resource Id |
|kind | String | false | Kind of resource |
|location | String | false | Resource Location |
|name | String | false | Resource Name |
|properties | String | false |  |
|resource_group_name | String | true | Name of resource group |
|slot | String | true | Name of web app slot. If not specified then will default to production slot. |
|subscription_id | String | true | Subscription Id |
|tags | Hash | false | Resource tags |
|type | String | false | Resource type |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the Deployment

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/slots/%{slot}/deployments/%{id}`|Put||Sites_CreateDeploymentSlot|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/slots/%{slot}/deployments/%{id}`|Get||Sites_GetDeploymentSlot|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/instances/%{instance_id}/deployments`|Get||Sites_GetInstanceDeployments|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/slots/%{slot}/deployments/%{id}`|Put||Sites_CreateDeploymentSlot|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/slots/%{slot}/deployments/%{id}`|Delete||Sites_DeleteDeploymentSlot|
