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
          results = results.map do |datum|
            relationships = datum.delete("links") || {}
            result_set.record_class.load(datum).tap do |obj|
              obj.relationships = Relations.new(relationships)
              obj.last_result_set = result_set
            end
          end
          result_set.concat(results)
        end

        def handle_meta(result_set, data)
          result_set.meta = data.fetch("meta", {})
        end

        def handle_pagination(result_set, data)
          result_set.pages = result_set.record_class.paginator.new(result_set, result_set.meta)
        end

        def handle_links(result_set, data)
          return if result_set.empty?

          result_set.included = LinkedData.new(result_set, data.fetch("links", {}), data.fetch("linked", {}))
        end

        def handle_errors(result_set, data)
          result_set.errors = result_set.meta.fetch("errors", []).map do |msg|
            ErrorCollector::Error.new({title: msg, detail: msg})
          end
        end
      end

    end
  end
end
