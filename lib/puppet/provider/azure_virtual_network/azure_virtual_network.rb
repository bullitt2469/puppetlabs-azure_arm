# require "pry"
# require "pry-rescue"
require "json"

Puppet::Type.type(:azure_virtual_network).provide(:arm) do
  mk_resource_methods

  def initialize(value = {})
    super(value)
    @property_flush = {}
    @is_create = false
    @is_delete = false
  end

  def etag=(value)
    Puppet.info("etag setter called to change to #{value}")
    @property_flush[:etag] = value
  end

  def id=(value)
    Puppet.info("id setter called to change to #{value}")
    @property_flush[:id] = value
  end

  def location=(value)
    Puppet.info("location setter called to change to #{value}")
    @property_flush[:location] = value
  end

  def name=(value)
    Puppet.info("name setter called to change to #{value}")
    @property_flush[:name] = value
  end

  def properties=(value)
    Puppet.info("properties setter called to change to #{value}")
    @property_flush[:properties] = value
  end

  def tags=(value)
    Puppet.info("tags setter called to change to #{value}")
    @property_flush[:tags] = value
  end

  def type=(value)
    Puppet.info("type setter called to change to #{value}")
    @property_flush[:type] = value
  end

  def self.instances
    fetch_all_as_hash
  end

  def self.prefetch(resources)
    instances.each do |prov|
      if (resource = (resources.find { |k, v| k.casecmp(prov.name).zero? } || [])[1])
        resource.provider = prov
      end
    end
  end

  def self.fetch_all_as_hash
    items = self.fetch_all
    if items
      items.collect do |item|
        hash = {

          api_version: item["api-version"],
          etag: item["etag"],
          id: item["id"],
          location: item["location"],
          name: item["name"],
          parameters: item["parameters"],
          properties: item["properties"],
          resource_group_name: item["resourceGroupName"],
          subscription_id: item["subscriptionId"],
          tags: item["tags"],
          type: item["type"],
          ensure: :present,
        }

        self.deep_delete(hash, [:properties, "subnets", "properties", "delegations", "properties", "provisioningState"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "hostedWorkloads"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "applicationSecurityGroups", "etag"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "applicationSecurityGroups", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "applicationSecurityGroups", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "applicationSecurityGroups", "properties", "resourceGuid"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "applicationSecurityGroups", "type"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "publicIPAddress", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "publicIPAddress", "type"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "properties", "networkInterfaceTapConfigurations", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "properties", "networkInterfaceTapConfigurations", "type"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "properties", "resourceGuid"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "ipConfigurations", "properties", "virtualNetworkTaps", "type"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "networkSecurityGroup", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "properties", "networkSecurityGroup", "type"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "networkInterfaces", "type"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "owner"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "interfaceEndpoints", "type"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "ipConfigurationProfiles", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "ipConfigurationProfiles", "type"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "purpose"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "resourceNavigationLinks", "etag"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "resourceNavigationLinks", "properties", "provisioningState"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "routeTable", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "routeTable", "type"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceAssociationLinks", "etag"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceAssociationLinks", "properties", "provisioningState"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceEndpointPolicies", "name"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceEndpointPolicies", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceEndpointPolicies", "properties", "resourceGuid"])

        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceEndpointPolicies", "properties", "serviceEndpointPolicyDefinitions", "properties", "provisioningState"])
        self.deep_delete(hash, [:properties, "subnets", "properties", "serviceEndpointPolicies", "type"])

        self.deep_delete(hash, [:type])
        Puppet.debug("Adding to collection: #{item}")

        new(hash) if hash
      end.compact
    else
      []
    end
  rescue Exception => ex
    Puppet.alert("ex is #{ex} and backtrace is #{ex.backtrace}")
    raise
  end

  def self.deep_delete(hash_item, tokens)
    if tokens.size == 1
      if hash_item.kind_of?(Array)
        hash_item.map! { |item| deep_delete(item, tokens) }
      else
        hash_item.delete(tokens[0]) unless hash_item.nil? or hash_item[tokens[0]].nil?
      end
    else
      if hash_item.kind_of?(Array)
        hash_item.map! { |item| deep_delete(item, tokens[1..-1]) }
      else
        hash_item[tokens.first] = deep_delete(hash_item[tokens.first], tokens[1..-1]) unless hash_item.nil?
      end
    end
    return hash_item
  end

  def self.fetch_all
    response = invoke_list_all
    if response.kind_of? Net::HTTPSuccess
      body = JSON.parse(response.body)
      if body.is_a? Hash and body.key? "value"
        return body["value"]
      end
    end
  end

  def self.instance_to_hash(instance)
    {
      ensure: :present,

      api_version: instance.api_version.respond_to?(:to_hash) ? instance.api_version.to_hash : instance.api_version,
      etag: instance.etag.respond_to?(:to_hash) ? instance.etag.to_hash : instance.etag,
      id: instance.id.respond_to?(:to_hash) ? instance.id.to_hash : instance.id,
      location: instance.location.respond_to?(:to_hash) ? instance.location.to_hash : instance.location,
      name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      parameters: instance.parameters.respond_to?(:to_hash) ? instance.parameters.to_hash : instance.parameters,
      properties: instance.properties.respond_to?(:to_hash) ? instance.properties.to_hash : instance.properties,
      resource_group_name: instance.resource_group_name.respond_to?(:to_hash) ? instance.resource_group_name.to_hash : instance.resource_group_name,
      subscription_id: instance.subscription_id.respond_to?(:to_hash) ? instance.subscription_id.to_hash : instance.subscription_id,
      tags: instance.tags.respond_to?(:to_hash) ? instance.tags.to_hash : instance.tags,
      type: instance.type.respond_to?(:to_hash) ? instance.type.to_hash : instance.type,
      object: instance,
    }
  end

  def create
    @is_create = true
    Puppet.info("Entered create for resource #{name} of type VirtualNetwork")
    hash = build_hash
    response = self.class.invoke_create(resource, hash)

    if response.is_a? Net::HTTPSuccess
      @property_hash[:ensure] = :present
      Puppet.info("Added :ensure to property hash")
    else
      raise Puppet::Error, "Create failed.  Response is #{response} and body is #{response.body}"
    end
  rescue Exception => ex
    Puppet.alert("Exception during create. The state of the resource is unknown.  ex is #{ex} and backtrace is #{ex.backtrace}")
    raise
  end

  def flush
    Puppet.info("Entered flush for resource #{name} of type VirtualNetwork - creating ? #{@is_create}, deleting ? #{@is_delete}")
    if @is_create || @is_delete
      return # we've already done the create or delete
    end

    hash = build_hash
    response = self.class.invoke_update(resource, hash)

    if response.is_a? Net::HTTPSuccess
      @property_hash[:ensure] = :present
      Puppet.info("Added :ensure to property hash")
    else
      raise Puppet::Error, "Flush failed.  The state of the resource is unknown.  Response is #{response} and body is #{response.body}"
    end
  rescue Exception => ex
    Puppet.alert("Exception during flush. ex is #{ex} and backtrace is #{ex.backtrace}")
    raise
  end

  def build_hash
    virtual_network = {}
    virtual_network["etag"] = resource[:etag] unless resource[:etag].nil?
    virtual_network["id"] = resource[:id] unless resource[:id].nil?
    virtual_network["location"] = resource[:location] unless resource[:location].nil?
    virtual_network["name"] = resource[:name] unless resource[:name].nil?
    virtual_network["properties"] = resource[:properties] unless resource[:properties].nil?
    virtual_network["tags"] = resource[:tags] unless resource[:tags].nil?
    virtual_network["type"] = resource[:type] unless resource[:type].nil?
    return virtual_network
  end

  def self.build_key_values
    key_values = {}
    key_values["api-version"] = "2018-11-01"
    key_values
  end

  def destroy
    delete(resource)
  end

  def delete(hash)
    Puppet.info("Entered delete for resource #{hash[:name]} of type <no value>")
    @is_delete = true
    response = self.class.invoke_delete(hash)

    if response.is_a? Net::HTTPSuccess
      @property_hash[:ensure] = :present
      Puppet.info "Added :absent to property_hash"
    else
      raise Puppet::Error, "Delete failed.  The state of the resource is unknown.  Response is #{response} and body is #{response.body}"
    end
  rescue Exception => ex
    Puppet.alert("Exception during destroy. ex is #{ex} and backtrace is #{ex.backtrace}")
    raise
  end

  def self.invoke_list_all(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_ListAll")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/providers/Microsoft.Network/virtualNetworks", "Get", "[application/json]")
  end

  def self.invoke_create(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_CreateOrUpdate")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("parameters", "body", "parameters", "parameters"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("virtualNetworkName", "path", "name", "virtual_network_name"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Network/virtualNetworks/%{virtual_network_name}", "Put", "[application/json]")
  end

  def self.invoke_update(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_CreateOrUpdate")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("parameters", "body", "parameters", "parameters"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("virtualNetworkName", "path", "name", "virtual_network_name"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Network/virtualNetworks/%{virtual_network_name}", "Put", "[application/json]")
  end

  def self.invoke_delete(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_Delete")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("virtualNetworkName", "path", "name", "virtual_network_name"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Network/virtualNetworks/%{virtual_network_name}", "Delete", "[application/json]")
  end

  def self.invoke_list_with_params(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_List")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Network/virtualNetworks", "Get", "[application/json]")
  end

  def self.invoke_get_one(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualNetworks_Get")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("etag", "body", "etag", "etag"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("virtualNetworkName", "path", "name", "virtual_network_name"),
    ]
    op_params.each do |i|
      inquery = i[:inquery]
      name = i[:name]
      paramalias = i[:paramalias]
      name_snake = i[:namesnake]
      if inquery == "query"
        query_params[name] = key_values[name] unless key_values[name].nil?
        query_params[name] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        query_params[name] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      else
        path_params[name_snake.to_sym] = key_values[name] unless key_values[name].nil?
        path_params[name_snake.to_sym] = ENV["azure_#{name_snake}"] unless ENV["azure_#{name_snake}"].nil?
        path_params[name_snake.to_sym] = resource[paramalias.to_sym] unless resource.nil? || resource[paramalias.to_sym].nil?
      end
    end
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Network/virtualNetworks/%{virtual_network_name}", "Get", "[application/json]")
  end

  def self.authenticate(path_params, query_params, header_params, body_params)
    token = fetch_oauth2_token
    if token
      header_params["Authorization"] = "Bearer #{token}"
      return true
    else
      return false
    end
  end

  def self.fetch_oauth2_token
    Puppet.info("Getting oauth2 token")
    @client_id = ENV["azure_client_id"]
    @client_secret = ENV["azure_client_secret"]
    @tenant_id = ENV["azure_tenant_id"]
    uri = URI("https://login.login.microsoftonline.us/#{@tenant_id}/oauth2/token")
    response = Net::HTTP.post_form(uri,
                                   "grant_type" => "client_credentials",
                                   "client_id" => @client_id,
                                   "client_secret" => @client_secret,
                                   "resource" => "https://management.usgovcloudapi.net/")

    Puppet.debug("get oauth2 token response code is #{response.code} and body is #{response.body}")
    success = response.is_a? Net::HTTPSuccess
    if success
      return JSON[response.body]["access_token"]
    else
      raise Puppet::Error, "Unable to get oauth2 token - response is #{response} and body is #{response.body}"
    end
  end

  def exists?
    return_value = @property_hash[:ensure] && @property_hash[:ensure] != :absent
    Puppet.info("Checking if resource #{name} of type <no value> exists, returning #{return_value}")
    return_value
  end

  def self.add_keys_to_request(request, hash)
    if hash
      hash.each { |x, v| request[x] = v }
    end
  end

  def self.to_query(hash)
    if hash
      return_value = hash.map { |x, v| "#{x}=#{v}" }.reduce { |x, v| "#{x}&#{v}" }
      if !return_value.nil?
        return return_value
      end
    end
    return ""
  end

  def self.op_param(name, inquery, paramalias, namesnake)
    operation_param = {:name => name, :inquery => inquery, :paramalias => paramalias, :namesnake => namesnake}
    return operation_param
  end

  def self.call_op(path_params, query_params, header_params, body_params, parent_host, operation_path, operation_verb, parent_consumes)
    uri_string = "https://#{parent_host}#{operation_path}" % path_params
    uri_string = uri_string + "?" + to_query(query_params)
    header_params["Content-Type"] = "application/json" # first of #{parent_consumes}
    if authenticate(path_params, query_params, header_params, body_params)
      Puppet.info("Authentication succeeded")
      uri = URI(uri_string)
      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
        if operation_verb == "Get"
          req = Net::HTTP::Get.new(uri)
        elsif operation_verb == "Put"
          req = Net::HTTP::Put.new(uri)
        elsif operation_verb == "Delete"
          req = Net::HTTP::Delete.new(uri)
        end
        add_keys_to_request(req, header_params)
        if body_params
          req.body = body_params.to_json
        end
        Puppet.debug("URI is (#{operation_verb}) #{uri}, body is #{body_params}, query params are #{query_params}, headers are #{header_params}")
        response = http.request req # Net::HTTPResponse object
        Puppet.debug("response code is #{response.code} and body is #{response.body}")
        success = response.is_a? Net::HTTPSuccess
        Puppet.info("Called (#{operation_verb}) endpoint at #{uri}, success was #{success}")
        return response
      end
    end
  end
end
# this is the end of the ruby class
