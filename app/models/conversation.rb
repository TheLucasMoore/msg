class Conversation < ActiveRecord::Base
  has_many :messages
  has_many :user_conversations
  has_many :users, through: :user_conversations

  def self.between(user_one, user_two)
    user_one.conversations.select { |convo| convo.users.include?(user_two) }.first
  end
end