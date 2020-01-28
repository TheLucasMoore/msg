class Message < ActiveRecord::Base
  belongs_to :user # the "sender"
  belongs_to :conversation # the "recipient"

  # Rails does this for ya, but we've got to hand roll it.
  # Much like Twitter, there is no edit feature and therefore no "updated_at".
  before_save :set_created_at

  def set_created_at
    self.created_at = Time.now
  end
end