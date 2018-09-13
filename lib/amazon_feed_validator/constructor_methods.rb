require 'amazon_feed_validator/feed_validator'

module AmazonFeedValidator
  def new(*args)
    AmazonFeedValidator::FeedValidator.new *args
  end
  module_function :new
end
