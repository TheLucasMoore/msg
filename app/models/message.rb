class Message < ActiveRecord::Base
  belongs_to :user # the "sender"
  belongs_to :conversation # the "recipient"
end