=begin
#Linstor REST API

#Linstor REST API V1  The V1 rest api of Linstor should stay compatible and only additions are made to the API, If there are breaking changes or redesigned a new major REST API version will be issued.  Server runs per default on port `3370` on `::` ipv6 and ipv4.  To change the bind address or port you can use the following linstor client commands: ``` linstor controller set-property REST/bindAddress 127.0.0.1 linstor controller set-property REST/port 8080 ```  After setting this properties restart the controller and the new values should be used.  Changelog:  * 1.0.13   - Fixed broken volume definition modify `flags` handling   - Added flags to volume groups (create/modify) * 1.0.12   - Added WritecacheResource and WritecacheVolume schemas.   - Removed support for swordfish   - Added `with_storage_pool` to PhysicalStorageCreate post request, allowing to create linstor storage pools too   - Added `gross` flag for volume-definition size   - Added flags to VolumeDefinitionModify (so that `gross` flag can be changed)   - Added query-max-volume-size to resource-groups * 1.0.11   - Added /v1/physical-storage endpoint, that lets you query and create lvm/zfs pools   - Extended Node with list of supported providers and layers as well as lists of reasons for     unsupported providers and layers * 1.0.10   - Added `reports` array field to Volume object, contains ApiCallRcs for problems   - Changed `ResourceDefinitions` can now include `VolumeDefinitions` in `volume_definitions` field   - Added various filter query parameters * 1.0.9   - Added supports_snapshots to StoragePool * 1.0.8   - Added /v1/resource-groups   - Added /v1/resource-groups/{rscgrp}/volume-groups   - Moved AutoSelectFilter::place_count default indirectly to create resource implementation   - Added diskless_on_remaining to AutoSelectFilter   - Changed /v1/view/resources return type to ResourceWithVolumes     ResourceWithVolumes is now a child type of Resource (removed volumes from Resource) * 1.0.7   - Added ext_meta_stor_pool to DrbdVolume   - Added is_active field to the NetInterface type * 1.0.6   - Added /v1/resource-definitions/{rscName}/resources/{nodeName}/volumes/{vlmnr} PUT * 1.0.5   - Added `reports` field to StoragePool object * 1.0.4   - Added /v1/view/storage-pools overview path   - Added uuid fields for objects * 1.0.3   - Added /v1/view/resources overview path   - documentation schema extraction * 1.0.2   - Added /v1/storage-pool-definitions object path   - added NVME layer object type * 1.0.1   - Documentation review and updates   - no functional changes * 1.0.0   - Initial REST API v1 

The version of the OpenAPI document: 1.0.13
Contact: rene.peinthor@linbit.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

module LinstorClient
  class ApiError < StandardError
    attr_reader :code, :response_headers, :response_body

    # Usage examples:
    #   ApiError.new
    #   ApiError.new("message")
    #   ApiError.new(:code => 500, :response_headers => {}, :response_body => "")
    #   ApiError.new(:code => 404, :message => "Not Found")
    def initialize(arg = nil)
      if arg.is_a? Hash
        if arg.key?(:message) || arg.key?('message')
          super(arg[:message] || arg['message'])
        else
          super arg
        end

        arg.each do |k, v|
          instance_variable_set "@#{k}", v
        end
      else
        super arg
      end
    end

    # Override to_s to display a friendly error message
    def to_s
      message
    end

    def message
      if @message.nil?
        msg = "Error message: the server returns an error"
      else
        msg = @message
      end

      msg += "\nHTTP status code: #{code}" if code
      msg += "\nResponse headers: #{response_headers}" if response_headers
      msg += "\nResponse body: #{response_body}" if response_body

      msg
    end
  end
end
