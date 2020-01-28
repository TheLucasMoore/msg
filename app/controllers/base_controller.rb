require './config/environment.rb'

class BaseController < Sinatra::Base

  get '/' do
    # render an index here?
    "Hello!"
  end
end
