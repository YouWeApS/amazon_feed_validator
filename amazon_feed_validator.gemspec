
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "amazon_feed_validator/version"

Gem::Specification.new do |spec|
  spec.name          = "amazon_feed_validator"
  spec.version       = AmazonFeedValidator::VERSION
  spec.authors       = ["Emil Kampp"]
  spec.email         = ["emil@kampp.me"]

  spec.summary       = "Validate your Amazon feed files"
  spec.description   = "Validates your Amazon XML feed files"
  spec.homepage      = "https://amazon.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0"

  spec.add_runtime_dependency "activesupport", "~> 5.2"
  spec.add_runtime_dependency "hashie", "~> 3.6"
  spec.add_runtime_dependency "nokogiri", "~> 1.8"
end
