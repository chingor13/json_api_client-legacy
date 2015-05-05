module JsonApiClient
  module Legacy
    class Parser

      class << self
        def parse(klass, response)
          data = response.body
          ResultSet.new.tap do |result_set|
            result_set.record_class = klass
            result_set.uri = response.env[:url]
            handle_data(result_set, data)
            handle_meta(result_set, data)
            handle_pagination(result_set, data)
            handle_links(result_set, data)
            handle_errors(result_set, data)
          end
        end

        private

        def handle_data(result_set, data)
          # data can live under the table name or the generic "data" key
          results = data.fetch(result_set.record_class.table_name) do
            results.fetch("data", [])
          end

          # we will treat everything as an Array
          results = [results] unless results.is_a?(Array)
          result_set.concat(results.map{|res| result_set.record_class.load(res)})
        end

        def handle_meta(result_set, data)
          result_set.meta = data.fetch("meta", {})
        end

        def handle_pagination(result_set, data)
          result_set.pages = result_set.record_class.paginator.new(result_set, result_set.meta)
        end

        def handle_links(result_set, data)
          return if result_set.empty?

          linked_data = LinkedData.new(
                          data.fetch("linked", {}),
                          LinkDefinition.new(data.fetch("links", {})),
                          result_set.record_class
                        )

          result_set.each do |resource|
            resource.linked_data = linked_data
          end
        end

        def handle_errors(result_set, data)
          result_set.errors = result_set.meta.fetch("errors", [])
        end
      end

    end
  end
end
