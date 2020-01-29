require './config/environment.rb'

class BaseController < Sinatra::Base

  get '/' do
    erb :index
    # This is to make sure you know the app is up and running!
  end
end
