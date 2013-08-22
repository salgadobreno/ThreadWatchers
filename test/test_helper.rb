if ENV.keys.grep(/ZEUS/).any?
  require 'minitest/unit'
  MiniTest::Unit.class_variable_set("@@installed_at_exit", true)
end

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
#require "minitest/debugger"


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

include FactoryGirl::Syntax::Methods

DatabaseCleaner[:mongoid].strategy = :truncation
