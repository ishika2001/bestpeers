class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"
  has_and_belongs_to_many :attenders, class_name: "User", dependent: :destroy
  has_many :tickets, dependent: :destroy

  # after_create :welcome_event



  private
  # def welcome_event
  #   CrudNotificatonMailer.create_notification.deliver_now
  # end
end