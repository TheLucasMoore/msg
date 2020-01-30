require 'spec_helper'

RSpec.describe MessagesController do
  
  # I know I'm repeating this, but it isolates this test
  let!(:user1) { User.find_or_create_by(name: "Lucas") }
  let!(:user2) { User.find_or_create_by(name: "Sarah") }
  let!(:convo) { Conversation.create }
  let!(:uc1) { UserConversation.create(user: user1, conversation: convo) }
  let!(:uc2) { UserConversation.create(user: user2, conversation: convo) }

  before :each do
    10.times do |n|
      Message.create(user: user1, conversation: convo, text: Faker::Quote.matz, created_at: n.days.ago)
      Message.create(user: user2, conversation: convo, text: Faker::Quote.yoda, created_at: n.days.ago)
    end
  end

  it 'allows a user to send a message to another' do
    post '/messages', params={"sender_id": user1.id, "receipient_id": user2.id, "text": "Hey there!" }
    expect(last_response.status).to eq 201
    body = JSON.parse(last_response.body)
    expect(body["text"]).to eq "Hey there!"
  end
end