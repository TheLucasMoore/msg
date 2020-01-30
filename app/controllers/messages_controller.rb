require './config/environment.rb'

class MessagesController < Sinatra::Base
  include LimitConcern

  # Index with limit params
  # params[:number_messages] to limit number of messages
  # params[:days_ago] to limit the timeframe of messages
  get '/messages' do
    messages = Message.all
    limit_response(params, messages)
  end

  # Allow a user to send a message to another user.
  post '/messages' do
    sender = User.find(params['sender_id'])
    receipient = User.find(params['receipient_id'])
    text = params['text']

    conversation = Conversation.between(sender, receipient)
    message = Message.create(user: sender, text: text, conversation: conversation)
    
    status 201
    body message.to_json
  end
end