Document: "account"


Path: "/tmp/azure-rest-api-specs/specification/datalake-store/resource-manager/Microsoft.DataLakeStore/stable/2016-11-01/account.json")

## FirewallRule

Data Lake Store firewall rule information.

```puppet
azure_datalakestore_firewall_rule {
  account_name => "account_name",
  api_version => "api_version",
  parameters => "parameters",
  properties => $azure_firewall_rule_properties
  resource_group_name => "resource_group_name",
  subscription_id => "subscription_id",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|account_name | String | true | The name of the Data Lake Store account. |
|api_version | String | true | Client Api Version. |
|parameters | Hash | true | Parameters supplied to create or update the firewall rule. |
|properties | [FirewallRuleProperties](#firewallruleproperties) | false | The firewall rule properties. |
|resource_group_name | String | true | The name of the Azure resource group. |
|subscription_id | String | true | Gets subscription credentials which uniquely identify Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. |
        
## FirewallRuleProperties

The firewall rule properties.

```puppet
$azure_firewall_rule_properties = {
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the FirewallRule

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataLakeStore/accounts/%{account_name}/firewallRules/%{firewall_rule_name}`|Put|Creates or updates the specified firewall rule. During update, the firewall rule with the specified name will be replaced with this new firewall rule.|FirewallRules_CreateOrUpdate|
|List - list all|``||||
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataLakeStore/accounts/%{account_name}/firewallRules/%{firewall_rule_name}`|Get|Gets the specified Data Lake Store firewall rule.|FirewallRules_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataLakeStore/accounts/%{account_name}/firewallRules`|Get|Lists the Data Lake Store firewall rules within the specified Data Lake Store account.|FirewallRules_ListByAccount|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataLakeStore/accounts/%{account_name}/firewallRules/%{firewall_rule_name}`|Put|Creates or updates the specified firewall rule. During update, the firewall rule with the specified name will be replaced with this new firewall rule.|FirewallRules_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.DataLakeStore/accounts/%{account_name}/firewallRules/%{firewall_rule_name}`|Delete|Deletes the specified firewall rule from the specified Data Lake Store account.|FirewallRules_Delete|
