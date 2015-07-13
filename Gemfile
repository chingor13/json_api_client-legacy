source 'https://rubygems.org'

# Specify your gem's dependencies in json_api_client-legacy.gemspec
gemspec

gem "json_api_client"

as_version = ENV["AS_VERSION"] || "default"

as_version = case as_version
when "default"
  ">= 3.2.0"
else
  "~> #{as_version}"
end