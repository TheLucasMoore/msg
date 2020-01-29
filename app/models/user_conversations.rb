class UserConversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  validates :user, uniqueness: { scope: :conversation, message: "User is already in this Conversation!" }
end