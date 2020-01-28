require 'spec_helper'

RSpec.describe Conversation do
  it 'should init a conversation' do
    convo = Conversation.new(name: "Our Group Text")
    expect(convo).to be_a Conversation
    expect(convo.name).to eq "Our Group Text"
  end

  it '.between finds a conversation between users' do
    user1 = User.create(name: "Lucas")
    user2 = User.create(name: "Sarah")
    convo = Conversation.create(name: "Our Group Text")
    
    UserConversation.create(user: user1, conversation: convo)
    UserConversation.create(user: user2, conversation: convo)

    expect(Conversation.between(user1, user2)).to eq convo
  end
end