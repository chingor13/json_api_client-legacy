module JsonApiClient
  module Legacy
    class LinkDefinition

      def initialize(spec)
        @spec = {}.with_indifferent_access
        spec.each do |type, definition|
          @spec[type.split(".").last] = definition.merge({slurp: type})
        end
      end

      def has_link?(type)
        @spec.has_key?(type)
      end
      alias has_attribute? has_link?

      def attribute_name_for(type)
        @spec.fetch(type).fetch("type")
      end

      def url_for(type, ids)
        definition = @spec.fetch(type)
        href = definition.fetch("href")
        slurp = definition.fetch("slurp")
        href.gsub("{#{slurp}}", Array(ids).join(","))
      end

      def as_json_api
        @spec
      end

    end
  end
end
