class Attender < ApplicationRecord
  validates :contact, length: { minimum: 10 }
  belongs_to :event
end
