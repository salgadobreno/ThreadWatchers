if ENV.keys.grep(/ZEUS/).any?
  require 'minitest/unit'
  MiniTest::Unit.class_variable_set("@@installed_at_exit", true)
end

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
#require "minitest/debugger"

require 'turn/autorun'

Turn.config.ansi = true
Turn.config.format = :dot
Turn.config.trace = 10

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

include FactoryGirl::Syntax::Methods

DatabaseCleaner[:mongoid].strategy = :truncation

class Capybara::Rails::TestCase
  before :each do
    DatabaseCleaner[:mongoid].start
  end

  after :each do
    DatabaseCleaner[:mongoid].clean
  end
end
