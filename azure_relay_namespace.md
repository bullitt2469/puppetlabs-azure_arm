Document: "relay"


Path: "/tmp/azure-rest-api-specs/specification/relay/resource-manager/Microsoft.Relay/stable/2017-04-01/relay.json")

## RelayNamespace

Description of a namespace resource.

```puppet
azure_relay_namespace {
  api_version => "api_version",
  location => "location (optional)",
  namespace_name => "namespace_name",
  parameters => "parameters",
  properties => $azure_relay_namespace_properties
  resource_group_name => "resource_group_name",
  sku => $azure_sku
  subscription_id => "subscription_id",
  tags => "tags (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | Client API version. |
|location | String | false | Resource location. |
|namespace_name | String | true | The namespace name |
|parameters | Hash | true | Parameters supplied to create a namespace resource. |
|properties | [RelayNamespaceProperties](#relaynamespaceproperties) | false | Description of Relay namespace |
|resource_group_name | String | true | Name of the Resource group within the Azure subscription. |
|sku | [Sku](#sku) | false | SKU of the namespace. |
|subscription_id | String | true | Subscription credentials which uniquely identify the Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. |
|tags | Hash | false | Resource tags. |
        
## RelayNamespaceProperties

Properties of the namespace.

```puppet
$azure_relay_namespace_properties = {
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
        
## Sku

SKU of the namespace.

```puppet
$azure_sku = {
  name => "name",
  tier => "tier (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|name | String | true | Name of this SKU. |
|tier | String | false | The tier of this SKU. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the RelayNamespace

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Relay/namespaces/%{namespace_name}`|Put|Create Azure Relay namespace.|Namespaces_CreateOrUpdate|
|List - list all|`/subscriptions/%{subscription_id}/providers/Microsoft.Relay/namespaces`|Get|Lists all the available namespaces within the subscription regardless of the resourceGroups.|Namespaces_List|
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Relay/namespaces/%{namespace_name}`|Get|Returns the description for the specified namespace.|Namespaces_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Relay/namespaces`|Get|Lists all the available namespaces within the ResourceGroup.|Namespaces_ListByResourceGroup|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Relay/namespaces/%{namespace_name}`|Put|Create Azure Relay namespace.|Namespaces_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Relay/namespaces/%{namespace_name}`|Delete|Deletes an existing namespace. This operation also removes all associated resources under the namespace.|Namespaces_Delete|
