module JsonApiClient
  module Legacy
    class QueryBuilder

      attr_reader :klass, :params

      def initialize(klass)
        @klass = klass
        @params = {}
      end

      def where(conditions = {})
        @params.merge!(conditions)
        self
      end
      alias paginate where

      def order(conditions)
        where(order: conditions)
      end

      def includes(*tables)
        @params[:includes] ||= []
        @params[:includes] += tables.flatten
        self
      end

      def page(number)
        where(page: number)
      end

      def first
        paginate(page: 1, per_page: 1).to_a.first
      end

      def build
        klass.new(params)
      end

      def to_a
        @to_a ||= find
      end
      alias all to_a

      def find(args = {})
        case args
        when Hash
          where(args)
        when Array
          where(klass.primary_key.to_s.pluralize.to_sym => args.join(","))
        else
          where(klass.primary_key => args)
        end

        klass.requestor.get(params)
      end

      def method_missing(method_name, *args, &block)
        to_a.send(method_name, *args, &block)
      end

    end
  end
end