module JsonApiClient
  module Legacy
    class Linker
      include Helpers::DynamicAttributes

      def initialize(links)
        self.attributes = links
      end

      def present?
        attributes.present?
      end

    end
  end
end