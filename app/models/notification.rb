class Notification < ApplicationRecord
  belongs_to :user

  def sender
    @sender = User.find(self.from)
  end
end
