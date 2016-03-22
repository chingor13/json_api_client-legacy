module JsonApiClient
  module Legacy
    class Relations
      include Helpers::DynamicAttributes

      def initialize(relations)
        self.attributes = {}
        relations.each do |k, v|
          attributes[k] = { data: v }
        end
      end

      def present?
        attributes.present?
      end
    end
  end
end
