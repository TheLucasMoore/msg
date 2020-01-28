require 'rack/test'
require 'rspec'
require './config/environment.rb'

# http://sinatrarb.com/testing.html

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods # needed for controller tests
  def app
    Sinatra::Application
  end
end

# For RSpec 2.x and 3.x
RSpec.configure do |c|
  c.include RSpecMixin

  # Clean out test database before each run
  c.before :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end
end

