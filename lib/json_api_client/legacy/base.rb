module JsonApiClient
  module Legacy
    class Base < Resource
      self.connection_class = JsonApiClient::Legacy::Connection
      self.relationship_linker = JsonApiClient::Legacy::LinkDefinition
      self.parser = JsonApiClient::Legacy::Parser
      self.paginator = JsonApiClient::Legacy::Paginator
      self.query_builder = JsonApiClient::Legacy::QueryBuilder
      self.requestor_class = JsonApiClient::Legacy::Requestor

      class << self
        def default_attributes
          {}
        end

        def path(params = nil)
          parts = [table_name]
          if params
            slurp = params.symbolize_keys.slice(*prefix_params)
            prefix_params.each do |param|
              params.delete(param)
            end
            parts.unshift(prefix_path % slurp)
          else
            parts.unshift(prefix_path)
          end
          parts.reject!{|part| part == "" }
          File.join(*parts)
        rescue KeyError
          raise ArgumentError, "Not all prefix parameters specified"
        end
      end

      def serializable_hash
        attributes.except(*self.class.prefix_params)
      end

    end
  end
end