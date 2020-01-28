require 'spec_helper'

RSpec.describe Conversation do
  it 'should init a conversation' do
    convo = Conversation.new(name: "Our Group Text")
    expect(convo).to be_a Conversation
    expect(convo.name).to eq "Our Group Text"
  end

  context '.between' do
    let(:user1) { User.create(name: "Lucas") }
    let(:user2) { User.create(name: "Sarah") }
    
    it 'finds a conversation between users that exists' do
      convo = Conversation.create(name: "Our Group Text")
      UserConversation.create(user: user1, conversation: convo)
      UserConversation.create(user: user2, conversation: convo)

      expect(Conversation.between(user1, user2)).to eq convo
    end

    it 'makes a new conversation if not present' do
      convo = Conversation.between(user1, user2)
      expect(convo.valid?).to be true
      expect(convo.name).to be_nil
    end
  end
end