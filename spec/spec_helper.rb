require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../app'
require_relative './setup_test_database'
require_relative './web_helper.rb'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,])
SimpleCov.start
Capybara.app = App
