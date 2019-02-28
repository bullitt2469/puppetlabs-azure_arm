Document: "apimgroups"


Path: "/tmp/azure-rest-api-specs/specification/apimanagement/resource-manager/Microsoft.ApiManagement/stable/2018-01-01/apimgroups.json")

## GroupContract

Contract details.

```puppet
azure_group_contract {
  api_version => "api_version",
  group_id => "group_id",
  if_match => "if_match",
  parameters => "parameters",
  properties => $azure_group_contract_properties
  resource_group_name => "resource_group_name",
  service_name => "service_name",
  subscription_id => "subscription_id",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | Version of the API to be used with the client request. |
|group_id | String | true | Group identifier. Must be unique in the current API Management service instance. |
|if_match | String | true | ETag of the Entity. ETag should match the current entity state from the header response of the GET request or it should be * for unconditional update. |
|parameters | Hash | true | Create parameters. |
|properties | [GroupContractProperties](#groupcontractproperties) | false | Group entity contract properties. |
|resource_group_name | String | true | The name of the resource group. |
|service_name | String | true | The name of the API Management service. |
|subscription_id | String | true | Subscription credentials which uniquely identify Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. |
        
## GroupContractProperties

Group contract Properties.

```puppet
$azure_group_contract_properties = {
  description => "description (optional)",
  displayName => "displayName",
  externalId => "externalId (optional)",
  type => "type (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|description | String | false | Group description. Can contain HTML formatting tags. |
|displayName | String | true | Group name. |
|externalId | String | false | For external groups, this property contains the id of the group from the external identity provider, e.g. for Azure Active Directory aad://<tenant>.onmicrosoft.com/groups/<group object id>; otherwise the value is null. |
|type | String | false | Group type. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the GroupContract

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/groups/%{group_id}`|Put|Creates or Updates a group.|Group_CreateOrUpdate|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/groups/%{group_id}`|Get|Gets the details of the group specified by its identifier.|Group_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/groups`|Get|Lists a collection of groups defined within a service instance.|Group_ListByService|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/groups/%{group_id}`|Put|Creates or Updates a group.|Group_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/groups/%{group_id}`|Delete|Deletes specific group of the API Management service instance.|Group_Delete|
