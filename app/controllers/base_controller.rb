require './config/environment.rb'

class BaseController < Sinatra::Base

  get '/' do
    "Hello!"
  end

  post '/message/' do
    sender = User.find(params['sender_id'])
    receipient = User.find(params['receipient_id'])
    message = params['text']

    conversation = Conversation.between(sender, receipient)
    msg = Message.create(user: sender, text: message, conversation: conversation)
    
    msg.to_json
  end
end
