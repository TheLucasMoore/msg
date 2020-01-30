require './config/environment.rb'

class ConversationsController < Sinatra::Base
  include LimitConcern
  
  # Show
  # params[:number_messages] to limit number of messages
  # params[:days_ago] to limit the timeframe of messages
  get '/conversations/:convo_id' do
    conversation = Conversation.find(params[:convo_id])
    sorted_messages = conversation.sorted_messages
    limit_response(params, sorted_messages)
  end

  # Show who is a part of this conversation
  get '/conversations/:convo_id/users' do
    conversation = Conversation.find(params[:convo_id])
    conversation.users.to_json
  end
end