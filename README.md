# Zanox::Deeplink

Creates a deep link for an advertiser URL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zanox-deeplink'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zanox-deeplink

## Usage

```ruby
Zanox::Deeplink.configure do |config|
  config.username = 'foo'
  config.password = 'bar'
  config.adspace  = '00000'
end
```

```ruby
Zanox.deeplink 'http://www.baby-markt.de/...'
```

## Contributing

1. Fork it ( https://github.com/spieker/zanox-deeplink/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
