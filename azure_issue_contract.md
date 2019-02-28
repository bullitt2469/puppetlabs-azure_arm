Document: "apimapis"


Path: "/tmp/azure-rest-api-specs/specification/apimanagement/resource-manager/Microsoft.ApiManagement/stable/2018-01-01/apimapis.json")

## IssueContract

Issue Contract details.

```puppet
azure_issue_contract {
  api_version => "api_version",
  api_id => "api_id",
  if_match => "if_match",
  issue_id => "issue_id",
  parameters => "parameters",
  properties => $azure_issue_contract_properties
  resource_group_name => "resource_group_name",
  service_name => "service_name",
  subscription_id => "subscription_id",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | Version of the API to be used with the client request. |
|api_id | String | true | API identifier. Must be unique in the current API Management service instance. |
|if_match | String | true | ETag of the Issue Entity. ETag should match the current entity state from the header response of the GET request or it should be * for unconditional update. |
|issue_id | String | true | Issue identifier. Must be unique in the current API Management service instance. |
|parameters | Hash | true | Create parameters. |
|properties | [IssueContractProperties](#issuecontractproperties) | false | Properties of the Issue. |
|resource_group_name | String | true | The name of the resource group. |
|service_name | String | true | The name of the API Management service. |
|subscription_id | String | true | Subscription credentials which uniquely identify Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. |
        
## IssueContractProperties

Issue contract Properties.

```puppet
$azure_issue_contract_properties = {
  apiId => "apiId (optional)",
  createdDate => "createdDate (optional)",
  description => "description",
  state => "state (optional)",
  title => "title",
  userId => "userId",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|apiId | String | false | A resource identifier for the API the issue was created for. |
|createdDate | String | false | Date and time when the issue was created. |
|description | String | true | Text describing the issue. |
|state | String | false | Status of the issue. |
|title | String | true | The issue title. |
|userId | String | true | A resource identifier for the user created the issue. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the IssueContract

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/apis/%{api_id}/issues/%{issue_id}`|Put|Creates a new Issue for an API or updates an existing one.|ApiIssue_CreateOrUpdate|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/apis/%{api_id}/issues/%{issue_id}`|Get|Gets the details of the Issue for an API specified by its identifier.|ApiIssue_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/apis/%{api_id}/issues`|Get|Lists all issues associated with the specified API.|ApiIssue_ListByService|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/apis/%{api_id}/issues/%{issue_id}`|Put|Creates a new Issue for an API or updates an existing one.|ApiIssue_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.ApiManagement/service/%{service_name}/apis/%{api_id}/issues/%{issue_id}`|Delete|Deletes the specified Issue from an API.|ApiIssue_Delete|
