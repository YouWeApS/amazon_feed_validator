# rubocop:disable Lint/HandleExceptions

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

import './lib/tasks/amazon.rake'

begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--display-cop-names']
  end
rescue LoadError
  # noop
end

RSpec::Core::RakeTask.new(:spec)

task default: %i[spec rubocop]

desc 'Load the environment'
task :environment do
  require_relative './lib/amazon_feed_validator'
end

# rubocop:enable Lint/HandleExceptions
