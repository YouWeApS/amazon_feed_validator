# AmazonFeedValidator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amazon_feed_validator'
```

## Usage

To validate a single feed item based on Amazons feed type enumeration:

```ruby
validator = AmazonFeedValidator.new(feed, name: 'Product')
validator.validate # => true or false
validator.errors # => ["Some error description"]
```

To validate a whole feed file:

```ruby
validator = AmazonFeedValidator.new(feed, name: 'amzn-envelope')
validator.validate # => true or false
validator.errors # => ["Some error description"]
```

## Development

To update xsd files run:

```bash
bundle exec rake amazon:xsd
```

## Testing

To run all tests:

```bash
bundle exec rake
```
