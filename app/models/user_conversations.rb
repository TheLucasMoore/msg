class UserConversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  # validate only two members to a group?
end