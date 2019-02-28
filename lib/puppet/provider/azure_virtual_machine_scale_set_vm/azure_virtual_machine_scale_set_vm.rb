# require "pry"
# require "pry-rescue"
require "json"

Puppet::Type.type(:azure_virtual_machine_scale_set_vm).provide(:arm) do
  mk_resource_methods

  def initialize(value = {})
    super(value)
    @property_flush = {}
    @is_create = false
    @is_delete = false
  end

  def id=(value)
    Puppet.info("id setter called to change to #{value}")
    @property_flush[:id] = value
  end

  def instance_id=(value)
    Puppet.info("instance_id setter called to change to #{value}")
    @property_flush[:instance_id] = value
  end

  def location=(value)
    Puppet.info("location setter called to change to #{value}")
    @property_flush[:location] = value
  end

  def name=(value)
    Puppet.info("name setter called to change to #{value}")
    @property_flush[:name] = value
  end

  def plan=(value)
    Puppet.info("plan setter called to change to #{value}")
    @property_flush[:plan] = value
  end

  def properties=(value)
    Puppet.info("properties setter called to change to #{value}")
    @property_flush[:properties] = value
  end

  def resources=(value)
    Puppet.info("resources setter called to change to #{value}")
    @property_flush[:resources] = value
  end

  def sku=(value)
    Puppet.info("sku setter called to change to #{value}")
    @property_flush[:sku] = value
  end

  def tags=(value)
    Puppet.info("tags setter called to change to #{value}")
    @property_flush[:tags] = value
  end

  def type=(value)
    Puppet.info("type setter called to change to #{value}")
    @property_flush[:type] = value
  end

  def zones=(value)
    Puppet.info("zones setter called to change to #{value}")
    @property_flush[:zones] = value
  end

  def create
    @is_create = true
    Puppet.info("Entered create for resource #{name} of type VirtualMachineScaleSetVM")
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
    Puppet.info("Entered flush for resource #{name} of type VirtualMachineScaleSetVM - creating ? #{@is_create}, deleting ? #{@is_delete}")
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
    virtual_machine_scale_set_vm = {}
    virtual_machine_scale_set_vm["id"] = resource[:id] unless resource[:id].nil?
    virtual_machine_scale_set_vm["instanceId"] = resource[:instance_id] unless resource[:instance_id].nil?
    virtual_machine_scale_set_vm["location"] = resource[:location] unless resource[:location].nil?
    virtual_machine_scale_set_vm["name"] = resource[:name] unless resource[:name].nil?
    virtual_machine_scale_set_vm["plan"] = resource[:plan] unless resource[:plan].nil?
    virtual_machine_scale_set_vm["properties"] = resource[:properties] unless resource[:properties].nil?
    virtual_machine_scale_set_vm["resources"] = resource[:resources] unless resource[:resources].nil?
    virtual_machine_scale_set_vm["sku"] = resource[:sku] unless resource[:sku].nil?
    virtual_machine_scale_set_vm["tags"] = resource[:tags] unless resource[:tags].nil?
    virtual_machine_scale_set_vm["type"] = resource[:type] unless resource[:type].nil?
    virtual_machine_scale_set_vm["zones"] = resource[:zones] unless resource[:zones].nil?
    return virtual_machine_scale_set_vm
  end

  def self.build_key_values
    key_values = {}
    key_values["api-version"] = "2018-10-01"
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

  def self.invoke_create(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualMachineScaleSetVMs_Update")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("instance_id", "path", "instance_id", "instance_id"),
      self.op_param("instanceid", "body", "instance_id", "instanceid"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("parameters", "body", "parameters", "parameters"),
      self.op_param("plan", "body", "plan", "plan"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("resources", "body", "resources", "resources"),
      self.op_param("sku", "body", "sku", "sku"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("vmScaleSetName", "path", "vm_scale_set_name", "vm_scale_set_name"),
      self.op_param("zones", "body", "zones", "zones"),
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
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Compute/virtualMachineScaleSets/%{vm_scale_set_name}/virtualmachines/%{instance_id}", "Put", "[application/json]")
  end

  def self.invoke_update(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualMachineScaleSetVMs_Update")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("instance_id", "path", "instance_id", "instance_id"),
      self.op_param("instanceid", "body", "instance_id", "instanceid"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("parameters", "body", "parameters", "parameters"),
      self.op_param("plan", "body", "plan", "plan"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("resources", "body", "resources", "resources"),
      self.op_param("sku", "body", "sku", "sku"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("vmScaleSetName", "path", "vm_scale_set_name", "vm_scale_set_name"),
      self.op_param("zones", "body", "zones", "zones"),
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
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Compute/virtualMachineScaleSets/%{vm_scale_set_name}/virtualmachines/%{instance_id}", "Put", "[application/json]")
  end

  def self.invoke_delete(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualMachineScaleSetVMs_Delete")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("instance_id", "path", "instance_id", "instance_id"),
      self.op_param("instanceid", "body", "instance_id", "instanceid"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("plan", "body", "plan", "plan"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("resources", "body", "resources", "resources"),
      self.op_param("sku", "body", "sku", "sku"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("vmScaleSetName", "path", "vm_scale_set_name", "vm_scale_set_name"),
      self.op_param("zones", "body", "zones", "zones"),
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
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Compute/virtualMachineScaleSets/%{vm_scale_set_name}/virtualmachines/%{instance_id}", "Delete", "[application/json]")
  end

  def self.invoke_list_with_params(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualMachineScaleSetVMs_List")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("$filter", "query", "$filter", "$filter"),
      self.op_param("$select", "query", "$select", "$select"),
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("instanceid", "body", "instance_id", "instanceid"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("plan", "body", "plan", "plan"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("resources", "body", "resources", "resources"),
      self.op_param("sku", "body", "sku", "sku"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("virtualMachineScaleSetName", "path", "virtual_machine_scale_set_name", "virtual_machine_scale_set_name"),
      self.op_param("zones", "body", "zones", "zones"),
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
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Compute/virtualMachineScaleSets/%{virtual_machine_scale_set_name}/virtualMachines", "Get", "[application/json]")
  end

  def self.invoke_get_one(resource = nil, body_params = nil)
    key_values = self.build_key_values
    Puppet.info("Calling operation VirtualMachineScaleSetVMs_Get")
    path_params = {}
    query_params = {}
    header_params = {}
    header_params["User-Agent"] = "puppetlabs-azure_arm/0.2.0"

    op_params = [
      self.op_param("api-version", "query", "api_version", "api_version"),
      self.op_param("id", "body", "id", "id"),
      self.op_param("instance_id", "path", "instance_id", "instance_id"),
      self.op_param("instanceid", "body", "instance_id", "instanceid"),
      self.op_param("location", "body", "location", "location"),
      self.op_param("name", "body", "name", "name"),
      self.op_param("plan", "body", "plan", "plan"),
      self.op_param("properties", "body", "properties", "properties"),
      self.op_param("resourceGroupName", "path", "resource_group_name", "resource_group_name"),
      self.op_param("resources", "body", "resources", "resources"),
      self.op_param("sku", "body", "sku", "sku"),
      self.op_param("subscriptionId", "path", "subscription_id", "subscription_id"),
      self.op_param("tags", "body", "tags", "tags"),
      self.op_param("type", "body", "type", "type"),
      self.op_param("vmScaleSetName", "path", "vm_scale_set_name", "vm_scale_set_name"),
      self.op_param("zones", "body", "zones", "zones"),
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
    self.call_op(path_params, query_params, header_params, body_params, "management.usgovcloudapi.net", "/subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.Compute/virtualMachineScaleSets/%{vm_scale_set_name}/virtualmachines/%{instance_id}", "Get", "[application/json]")
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
    uri = URI("https://login.microsoftonline.us/#{@tenant_id}/oauth2/token")
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
    Puppet.info("exists_one for resource #{name} of type <no value>")
    return exists_one(resource)
  end

  def exists_one(resource)
    response = self.class.invoke_get_one(resource)

    if response.is_a? Net::HTTPSuccess
      return true
    else
      return false
    end
  rescue Exception => ex
    Puppet.alert("Exception during exists_one. ex is #{ex} and backtrace is #{ex.backtrace}")
    raise
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
