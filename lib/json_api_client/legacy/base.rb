module JsonApiClient
  module Legacy
    class Base < Resource
      self.connection_class = JsonApiClient::Legacy::Connection
      self.parser = JsonApiClient::Legacy::Parser
      self.paginator = JsonApiClient::Legacy::Paginator
      self.query_builder = JsonApiClient::Legacy::QueryBuilder
      self.requestor_class = JsonApiClient::Legacy::Requestor

      def persisted?
        has_attribute?(self.class.primary_key)
      end

      protected

      def self.default_attributes
        {}
      end
    end
  end
end