module JsonApiClient
  module Legacy
    class Relations
      include Helpers::DynamicAttributes

      def initialize(relations)
        self.attributes = relations
      end

      def present?
        attributes.present?
      end
    end
  end
end