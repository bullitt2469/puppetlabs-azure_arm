Document: "edgegateway"


Path: "/tmp/azure-rest-api-specs/specification/edgegateway/resource-manager/Microsoft.DataBoxEdge/stable/2018-07-01/edgegateway.json")

## Role

Compute role.

```puppet
azure_role {
  api_version => "api_version",
  device_name => "device_name",
  kind => "kind",
  resource_group_name => "resource_group_name",
  role => "role",
  subscription_id => "subscription_id",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | The API version. |
|device_name | String | true | Name of the device in which the role needs to be added or updated. |
|kind | String | true | Role type. |
|resource_group_name | String | true | The resource group name. |
|role | Hash | true | Role to be added. |
|subscription_id | String | true | The subscription ID. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the Role

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/%{device_name}/roles/%{name}`|Put|Create or update a role.|Roles_CreateOrUpdate|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/%{device_name}/roles/%{name}`|Get|Get a specific role by name.|Roles_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/%{device_name}/roles`|Get|Lists all the roles configured in a data box edge/gateway device.|Roles_ListByDataBoxEdgeDevice|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/%{device_name}/roles/%{name}`|Put|Create or update a role.|Roles_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/%{device_name}/roles/%{name}`|Delete|Deletes the role on the gateway device.|Roles_Delete|
