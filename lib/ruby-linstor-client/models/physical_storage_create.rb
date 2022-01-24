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
  # If `with_storage_pool` is set a linstor storage pool will also be created using this device pool
  class PhysicalStorageCreate
    attr_accessor :provider_kind

    attr_accessor :device_paths

    # RAID level to use for pool. 
    attr_accessor :raid_level

    attr_accessor :pool_name

    attr_accessor :vdo_enable

    attr_accessor :vdo_slab_size_kib

    attr_accessor :vdo_logical_size_kib

    attr_accessor :with_storage_pool

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
        :'provider_kind' => :'provider_kind',
        :'device_paths' => :'device_paths',
        :'raid_level' => :'raid_level',
        :'pool_name' => :'pool_name',
        :'vdo_enable' => :'vdo_enable',
        :'vdo_slab_size_kib' => :'vdo_slab_size_kib',
        :'vdo_logical_size_kib' => :'vdo_logical_size_kib',
        :'with_storage_pool' => :'with_storage_pool'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'provider_kind' => :'ProviderKind',
        :'device_paths' => :'Array<String>',
        :'raid_level' => :'String',
        :'pool_name' => :'String',
        :'vdo_enable' => :'Boolean',
        :'vdo_slab_size_kib' => :'Integer',
        :'vdo_logical_size_kib' => :'Integer',
        :'with_storage_pool' => :'PhysicalStorageStoragePoolCreate'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `LinstorClient::PhysicalStorageCreate` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `LinstorClient::PhysicalStorageCreate`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'provider_kind')
        self.provider_kind = attributes[:'provider_kind']
      end

      if attributes.key?(:'device_paths')
        if (value = attributes[:'device_paths']).is_a?(Array)
          self.device_paths = value
        end
      end

      if attributes.key?(:'raid_level')
        self.raid_level = attributes[:'raid_level']
      else
        self.raid_level = 'JBOD'
      end

      if attributes.key?(:'pool_name')
        self.pool_name = attributes[:'pool_name']
      end

      if attributes.key?(:'vdo_enable')
        self.vdo_enable = attributes[:'vdo_enable']
      else
        self.vdo_enable = false
      end

      if attributes.key?(:'vdo_slab_size_kib')
        self.vdo_slab_size_kib = attributes[:'vdo_slab_size_kib']
      else
        self.vdo_slab_size_kib = 0
      end

      if attributes.key?(:'vdo_logical_size_kib')
        self.vdo_logical_size_kib = attributes[:'vdo_logical_size_kib']
      else
        self.vdo_logical_size_kib = 0
      end

      if attributes.key?(:'with_storage_pool')
        self.with_storage_pool = attributes[:'with_storage_pool']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @provider_kind.nil?
        invalid_properties.push('invalid value for "provider_kind", provider_kind cannot be nil.')
      end

      if @device_paths.nil?
        invalid_properties.push('invalid value for "device_paths", device_paths cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @provider_kind.nil?
      return false if @device_paths.nil?
      raid_level_validator = EnumAttributeValidator.new('String', ["JBOD"])
      return false unless raid_level_validator.valid?(@raid_level)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] raid_level Object to be assigned
    def raid_level=(raid_level)
      validator = EnumAttributeValidator.new('String', ["JBOD"])
      unless validator.valid?(raid_level)
        fail ArgumentError, "invalid value for \"raid_level\", must be one of #{validator.allowable_values}."
      end
      @raid_level = raid_level
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          provider_kind == o.provider_kind &&
          device_paths == o.device_paths &&
          raid_level == o.raid_level &&
          pool_name == o.pool_name &&
          vdo_enable == o.vdo_enable &&
          vdo_slab_size_kib == o.vdo_slab_size_kib &&
          vdo_logical_size_kib == o.vdo_logical_size_kib &&
          with_storage_pool == o.with_storage_pool
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [provider_kind, device_paths, raid_level, pool_name, vdo_enable, vdo_slab_size_kib, vdo_logical_size_kib, with_storage_pool].hash
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
