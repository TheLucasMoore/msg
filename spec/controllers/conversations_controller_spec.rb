require 'spec_helper'

RSpec.describe ConversationsController do

  # Setup this test. Eventually add FactoryBot.
  let(:user1) { User.create(name: "Lucas") }
  let(:user2) { User.create(name: "Sarah") }
  let(:convo) { Conversation.create }
  let(:uc1) { UserConversation.create(user: user1, conversation: convo) }
  let(:uc2) { UserConversation.create(user: user2, conversation: convo) }
  
  before :each do
    10.times do |n|
      Message.create(user: user1, conversation: convo, text: Faker::Quote.matz, created_at: n.days.ago)
      Message.create(user: user2, conversation: convo, text: Faker::Quote.yoda, created_at: n.days.ago)
    end
  end

  it 'shows all messages in a conversation' do
    get "/conversations/#{convo.id}"
    expect(last_response).to be_ok
    body = JSON.parse(last_response.body)
    expect(body.size).to eq 20 # all messages
  end

  it 'limit to number of messages' do
    get "/conversations/#{convo.id}?number_messages=10"
    expect(last_response).to be_ok
    body = JSON.parse(last_response.body)
    expect(body.size).to eq 10 # the last 10 messages
  end

  it 'limits messages to last N days' do
    get "/conversations/#{convo.id}?days_ago=1"
    expect(last_response).to be_ok
    body = JSON.parse(last_response.body)
    expect(body.size).to eq 2 # two messages created a day ago
  end
end