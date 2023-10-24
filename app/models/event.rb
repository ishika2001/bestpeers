class Event < ApplicationRecord
  after_create :navigate_to

  def navigate_to
    if user_signed_in?
      if current_user.role == "attender"
            belongs_to :
      else 
           has_many :events
      end
    end
  end
end
