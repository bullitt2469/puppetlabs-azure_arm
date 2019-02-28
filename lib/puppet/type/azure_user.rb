require "puppet/parameter/boolean"

# Autogenic core type

Puppet::Type.newtype(:azure_user) do
  @doc = "Represents a user who has access to one or more shares on the Edge storage device."

  ensurable

  validate do
    required_properties = [
      :properties,
      :device_name,
      :resource_group_name,
      :user,
    ]
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[:ensure] == :present && self[property].nil? && self.provider.send(property) == :absent
        raise Puppet::Error, "In azure_user you must provide a value for #{property}"
      end
    end
  end
  newproperty(:id) do
    desc "The path ID that uniquely identifies the object."
    validate do |value|
      true
    end
  end
  newparam(:name) do
    isnamevar
    desc "The name of the object."
    validate do |value|
      true
    end
  end
  newproperty(:properties) do
    desc "The storage account credential properties."
    validate do |value|
      true
    end
  end
  newproperty(:type) do
    desc "The hierarchical type of the object."
    validate do |value|
      true
    end
  end
  newparam(:api_version) do
    desc "The API version."
    validate do |value|
      true
    end
  end
  newparam(:device_name) do
    desc "The device name."
    validate do |value|
      true
    end
  end
  newparam(:resource_group_name) do
    desc "The resource group name."
    validate do |value|
      true
    end
  end
  newparam(:subscription_id) do
    desc "The subscription ID."
    validate do |value|
      true
    end
  end
  newparam(:user) do
    desc "The user object containing the user details and encrypted password."
    validate do |value|
      true
    end
  end
end
