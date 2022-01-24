=begin
#Linstor REST API

#Linstor REST API V1  The V1 rest api of Linstor should stay compatible and only additions are made to the API, If there are breaking changes or redesigned a new major REST API version will be issued.  Server runs per default on port `3370` on `::` ipv6 and ipv4.  To change the bind address or port you can use the following linstor client commands: ``` linstor controller set-property REST/bindAddress 127.0.0.1 linstor controller set-property REST/port 8080 ```  After setting this properties restart the controller and the new values should be used.  Changelog:  * 1.0.13   - Fixed broken volume definition modify `flags` handling   - Added flags to volume groups (create/modify) * 1.0.12   - Added WritecacheResource and WritecacheVolume schemas.   - Removed support for swordfish   - Added `with_storage_pool` to PhysicalStorageCreate post request, allowing to create linstor storage pools too   - Added `gross` flag for volume-definition size   - Added flags to VolumeDefinitionModify (so that `gross` flag can be changed)   - Added query-max-volume-size to resource-groups * 1.0.11   - Added /v1/physical-storage endpoint, that lets you query and create lvm/zfs pools   - Extended Node with list of supported providers and layers as well as lists of reasons for     unsupported providers and layers * 1.0.10   - Added `reports` array field to Volume object, contains ApiCallRcs for problems   - Changed `ResourceDefinitions` can now include `VolumeDefinitions` in `volume_definitions` field   - Added various filter query parameters * 1.0.9   - Added supports_snapshots to StoragePool * 1.0.8   - Added /v1/resource-groups   - Added /v1/resource-groups/{rscgrp}/volume-groups   - Moved AutoSelectFilter::place_count default indirectly to create resource implementation   - Added diskless_on_remaining to AutoSelectFilter   - Changed /v1/view/resources return type to ResourceWithVolumes     ResourceWithVolumes is now a child type of Resource (removed volumes from Resource) * 1.0.7   - Added ext_meta_stor_pool to DrbdVolume   - Added is_active field to the NetInterface type * 1.0.6   - Added /v1/resource-definitions/{rscName}/resources/{nodeName}/volumes/{vlmnr} PUT * 1.0.5   - Added `reports` field to StoragePool object * 1.0.4   - Added /v1/view/storage-pools overview path   - Added uuid fields for objects * 1.0.3   - Added /v1/view/resources overview path   - documentation schema extraction * 1.0.2   - Added /v1/storage-pool-definitions object path   - added NVME layer object type * 1.0.1   - Documentation review and updates   - no functional changes * 1.0.0   - Initial REST API v1 

The version of the OpenAPI document: 1.0.13
Contact: rene.peinthor@linbit.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module LinstorClient
  class Node
    attr_accessor :name

    attr_accessor :type

    attr_accessor :flags

    # A string to string property map.
    attr_accessor :props

    attr_accessor :net_interfaces

    # Enum describing the current connection status. 
    attr_accessor :connection_status

    # unique object id
    attr_accessor :uuid

    attr_accessor :storage_providers

    attr_accessor :resource_layers

    attr_accessor :unsupported_providers

    attr_accessor :unsupported_layers

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'name' => :'name',
        :'type' => :'type',
        :'flags' => :'flags',
        :'props' => :'props',
        :'net_interfaces' => :'net_interfaces',
        :'connection_status' => :'connection_status',
        :'uuid' => :'uuid',
        :'storage_providers' => :'storage_providers',
        :'resource_layers' => :'resource_layers',
        :'unsupported_providers' => :'unsupported_providers',
        :'unsupported_layers' => :'unsupported_layers'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'name' => :'String',
        :'type' => :'String',
        :'flags' => :'Array<String>',
        :'props' => :'Hash<String, String>',
        :'net_interfaces' => :'Array<NetInterface>',
        :'connection_status' => :'String',
        :'uuid' => :'String',
        :'storage_providers' => :'Array<ProviderKind>',
        :'resource_layers' => :'Array<LayerType>',
        :'unsupported_providers' => :'Hash<String, Array<String>>',
        :'unsupported_layers' => :'Hash<String, Array<String>>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `LinstorClient::Node` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `LinstorClient::Node`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'flags')
        if (value = attributes[:'flags']).is_a?(Array)
          self.flags = value
        end
      end

      if attributes.key?(:'props')
        if (value = attributes[:'props']).is_a?(Hash)
          self.props = value
        end
      end

      if attributes.key?(:'net_interfaces')
        if (value = attributes[:'net_interfaces']).is_a?(Array)
          self.net_interfaces = value
        end
      end

      if attributes.key?(:'connection_status')
        self.connection_status = attributes[:'connection_status']
      end

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end

      if attributes.key?(:'storage_providers')
        if (value = attributes[:'storage_providers']).is_a?(Array)
          self.storage_providers = value
        end
      end

      if attributes.key?(:'resource_layers')
        if (value = attributes[:'resource_layers']).is_a?(Array)
          self.resource_layers = value
        end
      end

      if attributes.key?(:'unsupported_providers')
        if (value = attributes[:'unsupported_providers']).is_a?(Hash)
          self.unsupported_providers = value
        end
      end

      if attributes.key?(:'unsupported_layers')
        if (value = attributes[:'unsupported_layers']).is_a?(Hash)
          self.unsupported_layers = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ["CONTROLLER", "SATELLITE", "COMBINED", "AUXILIARY"])
      return false unless type_validator.valid?(@type)
      connection_status_validator = EnumAttributeValidator.new('String', ["OFFLINE", "CONNECTED", "ONLINE", "VERSION_MISMATCH", "HOSTNAME_MISMATCH", "FULL_SYNC_FAILED", "AUTHENTICATION_ERROR", "UNKNOWN"])
      return false unless connection_status_validator.valid?(@connection_status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["CONTROLLER", "SATELLITE", "COMBINED", "AUXILIARY"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] connection_status Object to be assigned
    def connection_status=(connection_status)
      validator = EnumAttributeValidator.new('String', ["OFFLINE", "CONNECTED", "ONLINE", "VERSION_MISMATCH", "HOSTNAME_MISMATCH", "FULL_SYNC_FAILED", "AUTHENTICATION_ERROR", "UNKNOWN"])
      unless validator.valid?(connection_status)
        fail ArgumentError, "invalid value for \"connection_status\", must be one of #{validator.allowable_values}."
      end
      @connection_status = connection_status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          type == o.type &&
          flags == o.flags &&
          props == o.props &&
          net_interfaces == o.net_interfaces &&
          connection_status == o.connection_status &&
          uuid == o.uuid &&
          storage_providers == o.storage_providers &&
          resource_layers == o.resource_layers &&
          unsupported_providers == o.unsupported_providers &&
          unsupported_layers == o.unsupported_layers
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [name, type, flags, props, net_interfaces, connection_status, uuid, storage_providers, resource_layers, unsupported_providers, unsupported_layers].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = LinstorClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
