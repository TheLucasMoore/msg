require './config/environment.rb'

class ConversationsController < Sinatra::Base
  include LimitConcern
  
  # Show
  # <Optional> number_messages - params for the number of messages
  # <Optional> days_ago - params for the time period limit
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