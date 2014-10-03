ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rake'

Rails.application.load_tasks

Rails::TestTask.new('test:features' => 'test:prepare') do |t|
  t.pattern = 'test/features/**/*_test.rb'
end

Rake::Task['test:run'].enhance ['test:features']

task default: 'test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
