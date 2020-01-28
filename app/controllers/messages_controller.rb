require './config/environment.rb'

class MessagesController < Sinatra::Base
  
  # A sub-resource of user, but pertaining to their messages
  get '/users/:user_id/messages' do
    User.find(params['user_id']).messages.to_json
  end

  post '/messages/' do
    sender = User.find(params['sender_id'])
    receipient = User.find(params['receipient_id'])
    text = params['text']

    conversation = Conversation.between(sender, receipient)
    message = Message.create(user: sender, text: text, conversation: conversation)
    
    message.to_json
  end
end