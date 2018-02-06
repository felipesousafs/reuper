class Room < ApplicationRecord
  validates :number, :floor, presence: true

  has_many :users

  def room
    self.number.to_s + '/' + self.floor.to_s
  end
end
