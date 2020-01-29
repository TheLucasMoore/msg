require 'rack/test'
require 'rspec'
require 'faker'
require './config/environment.rb'

# http://sinatrarb.com/testing.html

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  # Bless ya StackOverflow https://stackoverflow.com/questions/56606013/how-to-make-rspec-load-config-ru
  def app
    @app ||= Rack::Builder.parse_file('./config.ru').first
  end
end

# For RSpec 2.x and 3.x
RSpec.configure do |c|
  c.include RSpecMixin
  c.include Rack::Test::Methods # needed for controller tests
  
  # Clean out test database before each run to keep tests clean
  c.before :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end 
end

