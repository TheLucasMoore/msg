require './config/environment.rb'

class MessagesController < Sinatra::Base
  
  get '/messages' do
    "Hey there"
  end
end