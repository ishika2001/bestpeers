class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :name,:price, presence: true
end
