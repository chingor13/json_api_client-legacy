# JsonApiClient::Legacy

`json_api_client-legacy` lets you use `json_api_client` version 1.0.0 with the previous response formats from 0.x. You can also see the [0.x branch](https://github.com/chingor13/json_api_client/tree/0.x)

The interface should be exactly the same as `json_api_client` except that you should inherit from `JsonApiClient::Legacy::Base` instead of `JsonApiClient::Resource`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_api_client-legacy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_api_client-legacy

## Usage

```
class MyApi < JsonApiClient::Legacy::Base
  self.site = "http://example.com/api/2"
end

# use exactly like `json_api_client` version 1.0.0
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/json_api_client-legacy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
