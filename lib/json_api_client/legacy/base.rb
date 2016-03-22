module JsonApiClient
  module Legacy
    class Base < Resource
      self.connection_class = JsonApiClient::Legacy::Connection
      # self.relationship_linker = JsonApiClient::Legacy::LinkDefinition
      self.parser = JsonApiClient::Legacy::Parser
      self.paginator = JsonApiClient::Legacy::Paginator
      self.query_builder = JsonApiClient::Legacy::QueryBuilder
      self.requestor_class = JsonApiClient::Legacy::Requestor

      class << self
        def resource
          File.join(self.site, self.table_name)
        end

        def default_attributes
          {}
        end
      end

      def as_json_api(*)
        attributes_for_serialization
      end

      def ==(other)
        attributes == other.attributes
      end

    end
  end
end
