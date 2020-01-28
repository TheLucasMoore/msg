class User < ActiveRecord::Base
  has_many :messages
  has_many :user_conversations
  has_many :conversations, through: :user_conversations

  validates :name, uniqueness: true

  def as_json_api
    api = {}
    api['user'] = self.as_json
    api['conversations'] = self.conversations
    api.to_json
  end
end