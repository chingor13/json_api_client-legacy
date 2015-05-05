require "json_api_client"
require "json_api_client/legacy/version"

module JsonApiClient
  module Legacy
    autoload :Base, "json_api_client/legacy/base"
    autoload :Connection, "json_api_client/legacy/connection"
    autoload :LinkDefinition, "json_api_client/legacy/link_definition"
    autoload :LinkedData, "json_api_client/legacy/linked_data"
    autoload :Paginator, "json_api_client/legacy/paginator"
    autoload :Parser, "json_api_client/legacy/parser"
    autoload :QueryBuilder, "json_api_client/legacy/query_builder"
    autoload :Requestor, "json_api_client/legacy/requestor"
  end
end
