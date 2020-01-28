require './config/environment.rb'

class UsersController < Sinatra::Base

  # I am not worrying about registration here.
  # The intention is to share data so you can play with this API.

  # Index
  get '/users' do
    User.all.to_json
  end

  # Show
  # A user, their name and all their conversations
  get '/users/:id' do
    User.find(params[:id]).as_json_api
  end
end
