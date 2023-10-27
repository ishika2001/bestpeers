class Ticket < ApplicationRecord
  belongs_to :event
  # belongs_to :attender, class_name: "User"
end
