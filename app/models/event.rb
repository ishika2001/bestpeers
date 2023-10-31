class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"
  has_and_belongs_to_many :attenders, class_name: "User", dependent: :destroy
  has_many :tickets, dependent: :destroy
end