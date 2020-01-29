require './config/environment.rb'

class BaseController < Sinatra::Base

  get '/' do
    erb :index
  end
end
