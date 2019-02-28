Document: "keyvault"


Path: "/tmp/azure-rest-api-specs/specification/keyvault/resource-manager/Microsoft.KeyVault/stable/2018-02-14/keyvault.json")

## Vault

Resource information with extended details.

```puppet
azure_vault {
  api_version => "api_version",
  location => "location (optional)",
  parameters => "parameters",
  properties => $azure_vault_properties
  resource_group_name => "resource_group_name",
  subscription_id => "subscription_id",
  tags => "tags (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|api_version | String | true | Client Api Version. |
|location | String | false | The supported Azure location where the key vault should be created. |
|parameters | Hash | true | Parameters to create or update the vault |
|properties | [VaultProperties](#vaultproperties) | true | Properties of the vault |
|resource_group_name | String | true | The name of the Resource Group to which the server belongs. |
|subscription_id | String | true | Subscription credentials which uniquely identify Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. |
|tags | Hash | false | The tags that will be assigned to the key vault.  |
        
## VaultProperties

Properties of the vault

```puppet
$azure_vault_properties = {
  accessPolicies => $azure_access_policy_entry
  createMode => "createMode (optional)",
  enabledForDeployment => "enabledForDeployment (optional)",
  enabledForDiskEncryption => "enabledForDiskEncryption (optional)",
  enabledForTemplateDeployment => "enabledForTemplateDeployment (optional)",
  enablePurgeProtection => "enablePurgeProtection (optional)",
  enableSoftDelete => "enableSoftDelete (optional)",
  networkAcls => $azure_network_rule_set
  sku => $azure_sku
  tenantId => "tenantId",
  vaultUri => "vaultUri (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|accessPolicies | [AccessPolicyEntry](#accesspolicyentry) | false | An array of 0 to 16 identities that have access to the key vault. All identities in the array must use the same tenant ID as the key vault's tenant ID. |
|createMode | String | false | The vault's create mode to indicate whether the vault need to be recovered or not. |
|enabledForDeployment | Boolean | false | Property to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. |
|enabledForDiskEncryption | Boolean | false | Property to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. |
|enabledForTemplateDeployment | Boolean | false | Property to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. |
|enablePurgeProtection | Boolean | false | Property specifying whether protection against purge is enabled for this vault. Setting this property to true activates protection against purge for this vault and its content - only the Key Vault service may initiate a hard, irrecoverable deletion. The setting is effective only if soft delete is also enabled. Enabling this functionality is irreversible - that is, the property does not accept false as its value. |
|enableSoftDelete | Boolean | false | Property to specify whether the 'soft delete' functionality is enabled for this key vault. It does not accept false value. |
|networkAcls | [NetworkRuleSet](#networkruleset) | false | A collection of rules governing the accessibility of the vault from specific network locations. |
|sku | [Sku](#sku) | true | SKU details |
|tenantId | String | true | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. |
|vaultUri | String | false | The URI of the vault for performing operations on keys and secrets. |
        
## AccessPolicyEntry

An identity that have access to the key vault. All identities in the array must use the same tenant ID as the key vault's tenant ID.

```puppet
$azure_access_policy_entry = {
  applicationId => "applicationId (optional)",
  objectId => "objectId",
  permissions => $azure_permissions
  tenantId => "tenantId",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|applicationId | String | false |  Application ID of the client making request on behalf of a principal |
|objectId | String | true | The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. |
|permissions | [Permissions](#permissions) | true | Permissions the identity has for keys, secrets and certificates. |
|tenantId | String | true | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. |
        
## Permissions

Permissions the identity has for keys, secrets, certificates and storage.

```puppet
$azure_permissions = {
  certificates => "certificates (optional)",
  keys => "keys (optional)",
  secrets => "secrets (optional)",
  storage => "storage (optional)",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|certificates | Array | false | Permissions to certificates |
|keys | Array | false | Permissions to keys |
|secrets | Array | false | Permissions to secrets |
|storage | Array | false | Permissions to storage accounts |
        
## NetworkRuleSet

A set of rules governing the network accessibility of a vault.

```puppet
$azure_network_rule_set = {
  bypass => "bypass (optional)",
  defaultAction => "defaultAction (optional)",
  ipRules => $azure_ip_rule
  virtualNetworkRules => $azure_virtual_network_rule
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|bypass | String | false | Tells what traffic can bypass network rules. This can be 'AzureServices' or 'None'.  If not specified the default is 'AzureServices'. |
|defaultAction | String | false | The default action when no rule from ipRules and from virtualNetworkRules match. This is only used after the bypass property has been evaluated. |
|ipRules | [IPRule](#iprule) | false | The list of IP address rules. |
|virtualNetworkRules | [VirtualNetworkRule](#virtualnetworkrule) | false | The list of virtual network rules. |
        
## IPRule

A rule governing the accessibility of a vault from a specific ip address or ip range.

```puppet
$azure_ip_rule = {
  value => "value",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|value | String | true | An IPv4 address range in CIDR notation, such as '124.56.78.91' (simple IP address) or '124.56.78.0/24' (all addresses that start with 124.56.78). |
        
## VirtualNetworkRule

A rule governing the accessibility of a vault from a specific virtual network.

```puppet
$azure_virtual_network_rule = {
  id => "id",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|id | String | true | Full resource id of a vnet subnet, such as '/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/test-vnet/subnets/subnet1'. |
        
## Sku

SKU details

```puppet
$azure_sku = {
  family => "family",
  name => "name",
}
```

| Name        | Type           | Required       | Description       |
| ------------- | ------------- | ------------- | ------------- |
|family | String | true | SKU family name |
|name | String | true | SKU name to specify whether the key vault is a standard vault or a premium vault. |



## CRUD operations

Here is a list of endpoints that we use to create, read, update and delete the Vault

| Operation | Path | Verb | Description | OperationID |
| ------------- | ------------- | ------------- | ------------- | ------------- |
|Create|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.KeyVault/vaults/%{vault_name}`|Put|Create or update a key vault in the specified subscription.|Vaults_CreateOrUpdate|
|List - list all|`/subscriptions/%{subscription_id}/providers/Microsoft.KeyVault/vaults`|Get|The List operation gets information about the vaults associated with the subscription.|Vaults_ListBySubscription|
|List - get one|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.KeyVault/vaults/%{vault_name}`|Get|Gets the specified Azure key vault.|Vaults_Get|
|List - get list using params|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.KeyVault/vaults`|Get|The List operation gets information about the vaults associated with the subscription and within the specified resource group.|Vaults_ListByResourceGroup|
|Update|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.KeyVault/vaults/%{vault_name}`|Put|Create or update a key vault in the specified subscription.|Vaults_CreateOrUpdate|
|Delete|`/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.KeyVault/vaults/%{vault_name}`|Delete|Deletes the specified Azure key vault.|Vaults_Delete|
