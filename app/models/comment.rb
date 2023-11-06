class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :attender, class_name: "User"
  validates :description, presence: true

end
