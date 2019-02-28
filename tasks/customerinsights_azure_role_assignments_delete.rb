#!/opt/puppetlabs/puppet/bin/ruby

require 'json'
require 'puppet'

def role_assignments_delete(*args)
  header_params = {}
  argstring = args[0].delete('\\')
  arg_hash = JSON.parse(argstring)

  # Remove task name from arguments - should contain all necessary parameters for URI
  arg_hash.delete('_task')
  operation_verb = 'Delete'

  query_params, body_params, path_params = format_params(arg_hash)

  uri_string = "https://management.azure.com//subscriptions/%{subscription_id}/resourceGroups/%{resource_group_name}/providers/Microsoft.CustomerInsights/hubs/%{hub_name}/roleAssignments/%{assignment_name}" % path_params

  unless query_params.empty?
    uri_string = uri_string + '?' + to_query(query_params)
  end

  header_params['Content-Type'] = 'application/json' # first of #{parent_consumes}

  return nil unless authenticate(header_params) == true

  uri = URI(uri_string)
  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
    if operation_verb == 'Get'
      req = Net::HTTP::Get.new(uri)
    elsif operation_verb == 'Put'
      req = Net::HTTP::Put.new(uri)
    elsif operation_verb == 'Delete'
      req = Net::HTTP::Delete.new(uri)
    end

    header_params.each { |x, v| req[x] = v } unless header_params.empty?
    unless body_params.empty?
      req.body=body_params.to_json
    end

    Puppet.debug("URI is (#{operation_verb}) #{uri} headers are #{header_params}")
    response = http.request req # Net::HTTPResponse object
	Puppet.debug("Called (#{operation_verb}) endpoint at #{uri}")
    Puppet.debug("response code is #{response.code} and body is #{response.body}")
    response
  end
end

def to_query(hash)
  if hash
    return_value = hash.map { |x, v| "#{x}=#{v}" }.reduce { |x, v| "#{x}&#{v}" }
    if !return_value.nil?
      return return_value
    end
  end
  return ''
end

def op_param(name, inquery, paramalias, namesnake)
    operation_param = { :name => name, :location => inquery, :paramalias => paramalias, :namesnake => namesnake }
    return operation_param
end

def format_params(key_values)
  query_params = {}
  body_params = {}
  path_params = {}

  key_values.each do |key,value|
   if value.include? '{'
    key_values[key]=JSON.parse(value.gsub("\'","\""))
   end
  end

  op_params = [
      op_param('api-version', 'query', 'api_version', 'api_version'),
      op_param('assignment_name', 'path', 'assignment_name', 'assignment_name'),
      op_param('assignmentname', 'body', 'assignment_name', 'assignmentname'),
      op_param('conflationpolicies', 'body', 'conflation_policies', 'conflationpolicies'),
      op_param('connectors', 'body', 'connectors', 'connectors'),
      op_param('description', 'body', 'description', 'description'),
      op_param('displayname', 'body', 'display_name', 'displayname'),
      op_param('hubName', 'path', 'hub_name', 'hub_name'),
      op_param('interactions', 'body', 'interactions', 'interactions'),
      op_param('kpis', 'body', 'kpis', 'kpis'),
      op_param('links', 'body', 'links', 'links'),
      op_param('principals', 'body', 'principals', 'principals'),
      op_param('profiles', 'body', 'profiles', 'profiles'),
      op_param('provisioningstate', 'body', 'provisioning_state', 'provisioningstate'),
      op_param('relationshiplinks', 'body', 'relationship_links', 'relationshiplinks'),
      op_param('relationships', 'body', 'relationships', 'relationships'),
      op_param('resourceGroupName', 'path', 'resource_group_name', 'resource_group_name'),
      op_param('role', 'body', 'role', 'role'),
      op_param('roleassignments', 'body', 'role_assignments', 'roleassignments'),
      op_param('saspolicies', 'body', 'sas_policies', 'saspolicies'),
      op_param('segments', 'body', 'segments', 'segments'),
      op_param('subscriptionId', 'path', 'subscription_id', 'subscription_id'),
      op_param('tenantid', 'body', 'tenant_id', 'tenantid'),
      op_param('views', 'body', 'views', 'views'),
      op_param('widgettypes', 'body', 'widget_types', 'widgettypes'),
    ]
  op_params.each do |i|
    location = i[:location]
    name     = i[:name]
    paramalias = i[:paramalias]
    name_snake = i[:namesnake]
    if location == 'query'
      query_params[name] = key_values[name_snake] unless key_values[name_snake].nil?
      query_params[name] = ENV["azure__#{name_snake}"] unless ENV["<no value>_#{name_snake}"].nil?
    elsif location == 'body'
      body_params[name] = key_values[name_snake] unless key_values[name_snake].nil?
      body_params[name] = ENV["azure_#{name_snake}"] unless ENV["<no value>_#{name_snake}"].nil?
    else
      path_params[name_snake.to_sym] = key_values[name_snake] unless key_values[name_snake].nil?
      path_params[name_snake.to_sym] = ENV["azure__#{name_snake}"] unless ENV["<no value>_#{name_snake}"].nil?
    end
  end
  
  return query_params,body_params,path_params
end
def fetch_oauth2_token
  Puppet.debug('Getting oauth2 token')
  @client_id = ENV['azure_client_id']
  @client_secret = ENV['azure_client_secret']
  @tenant_id = ENV['azure_tenant_id']
  uri = URI("https://login.login.microsoftonline.us/#{@tenant_id}/oauth2/token")
  response = Net::HTTP.post_form(uri,
                                  'grant_type' => 'client_credentials',
                                  'client_id'     => @client_id,
                                  'client_secret' => @client_secret,
                                  'resource'      => 'https://management.azure.com/')

  Puppet.debug("get oauth2 token response code is #{response.code} and body is #{response.body}")
  success = response.is_a? Net::HTTPSuccess
  if success
    return JSON[response.body]["access_token"]
  else
    raise Puppet::Error, "Unable to get oauth2 token - response is #{response} and body is #{response.body}"
  end
end

def authenticate(header_params)
  token = fetch_oauth2_token
  if token
    header_params['Authorization'] = "Bearer #{token}"
    return true
  else
    return false
  end
end



def task
  # Get operation parameters from an input JSON
  params = STDIN.read
  result = role_assignments_delete(params)
  if result.is_a? Net::HTTPSuccess
    puts result.body
  else
    raise result.body
  end
rescue StandardError => e
  result = {}
  result[:_error] = {
    msg: e.message,
    kind: 'puppetlabs-azure_arm/error',
    details: { class: e.class.to_s },
  }
  puts result
  exit 1
end

task