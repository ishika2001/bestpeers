class Event < ApplicationRecord
  belongs_to :user
  has_many :attenders
end
