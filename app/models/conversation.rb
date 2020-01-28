class Conversation < ActiveRecord::Base
  has_many :messages
  has_many :user_conversations
  has_many :users, through: :user_conversations

  def self.between(user_one, user_two)
    # check for existing conversation
    convo = user_one.conversations.select { |convo| convo.users.include?(user_two) }
    
    if convo.present?
      convo.first
    else
      Conversation.create_for_users!(user_one, user_two)
    end
  end

  def self.create_for_users!(user_one, user_two)
    nameless_convo = Conversation.create
    UserConversation.create(user: user_one, conversation: nameless_convo)
    UserConversation.create(user: user_two, conversation: nameless_convo)
    nameless_convo
  end

  def sorted_messages
    self.messages.sort_by(&:created_at)
  end
end