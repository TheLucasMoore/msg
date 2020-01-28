require './config/environment.rb'

class ConversationsController < Sinatra::Base

  # Show
  # Optional params for the number of messages
  # Optional params for the time period limit
  get '/conversations/:convo_id' do
    limit_number = params[:number_messages]
    limit_days = params[:days_ago]
    
    conversation = Conversation.find(params[:convo_id])
    sorted_messages = conversation.sorted_messages

    if limit_number
      sorted_messages.last(limit_number.to_i).to_json
    elsif limit_days
      sorted_messages.select { |msg| msg.created_at > limit_days.to_i.days.ago }.to_json
    else
      sorted_messages.to_json
    end
  end
end