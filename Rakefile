require "bundler/gem_tasks"
require "rspec/core/rake_task"

import "./lib/tasks/amazon.rake"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Load the environment"
task :environment do
  require_relative './lib/amazon_feed_validator'
end
