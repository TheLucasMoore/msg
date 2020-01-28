require './config/environment.rb'

class UsersController < Sinatra::Base

  # Index
  get '/users' do
    User.all.to_json
  end

  # Show
  # A user, their name and all conversations
  get '/users/:id' do
    User.find(params[:id]).as_json_api
  end
end
