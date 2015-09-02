# Omniauth  Spiceworks

Spiceworks Oauth2 strategy for OmniAuth.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-spiceworks'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-spiceworks

## Usage

TODO: OmniAuth::Strategies::Spiceworks is a Rack middleware. For in depth
instuction read the [OmniAuth docs](https://github.com/intridea/omniauth).

Here's an example of how to configure this gem with a Rails app in `config/initializers/omniauth.rb`:
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spiceworks, ENV['SPICEWORKS_KEY'], ENV['SPICEWORKS_SECRET']
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-spiceworks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

