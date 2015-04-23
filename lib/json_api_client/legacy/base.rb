module JsonApiClient
  module Legacy
    class Base < Resource
      self.parser = JsonApiClient::Legacy::Parser
      self.paginator = JsonApiClient::Legacy::Paginator
      self.query_builder= JsonApiClient::Legacy::QueryBuilder
    end
  end
end