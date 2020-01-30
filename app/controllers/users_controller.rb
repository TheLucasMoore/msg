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

  # A sub-resource of user, but pertaining to their conversations
  get '/users/:user_id/conversations' do
    User.find(params['user_id']).conversations.to_json
  end

  # A sub-resource of user, but pertaining to their messages
  get '/users/:user_id/messages' do
    User.find(params['user_id']).messages.to_json
  end
end
