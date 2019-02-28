Document: "service"


Path: "/tmp/azure-rest-api-specs/specification/web/resource-manager/Microsoft.Web/stable/2015-08-01/service.json")

## RelayServiceConnectionEntity

Class that represents a BizTalk Hybrid Connection

```puppet
azure_web_relay_service_connection_entity {
  api_version => "api_version",
  connection_envelope => "connectionEnvelope",
  entity_name => "entity_name",
  id => "id (optional)",
  kind => "kind (optional)",
  location => "location (optional)",
  name => "name (optional)",
  properties => "properties (optional)",
  resource_group_name => "resource_group_name",
  subscription_id => "subscription_id",
  tags => "tags (optional)",
  type => "type (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | API Version |
|connection_envelope | Hash | true | The details of the Hybrid Connection |
|entity_name | String | true | The name by which the Hybrid Connection is identified |
|id | String | false | Resource Id |
|kind | String | false | Kind of resource |
|location | String | false | Resource Location |
|name | String | false | Resource Name |
|properties | String | false |  |
|resource_group_name | String | true | The resource group name |
|subscription_id | String | true | Subscription Id |
|tags | Hash | false | Resource tags |
|type | String | false | Resource type |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the RelayServiceConnectionEntity

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/hybridconnection/%{entity_name}`|Put||Sites_CreateOrUpdateSiteRelayServiceConnection|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/hybridconnection`|Get||Sites_ListSiteRelayServiceConnections|
|List - get list using params|``||||
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/hybridconnection/%{entity_name}`|Put||Sites_CreateOrUpdateSiteRelayServiceConnection|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Web/sites/%{name}/hybridconnection/%{entity_name}`|Delete||Sites_DeleteSiteRelayServiceConnection|
