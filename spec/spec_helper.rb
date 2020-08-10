require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config| 
  config.before(:each) do 
   
  end
 end

SimpleCov.formatter =
SimpleCov::Formatter::MultiFormatter.new([ 
  SimpleCov::Formatter::Console,])
 SimpleCov.start 
Capybara.app = App
