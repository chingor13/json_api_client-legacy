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

      def set_attribute(name, value)
        if association = association_for(name.to_sym)
          value = association.association_class.load(value)
        end
        super(name, value)
      end

      def as_json_api(*)
        attributes_for_serialization
      end

      def ==(other)
        self.class == other.class &&
          attributes == other.attributes
      end

      protected

      def read_relationship(name)
        super || read_attribute(name)
      end

    end
  end
end
