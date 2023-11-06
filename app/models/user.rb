class User < ApplicationRecord
   has_many :events, class_name: "Event", foreign_key: "organizer_id", dependent: :destroy
   has_many :comments, class_name: "Comment", foreign_key: "attender_id", dependent: :destroy
   has_many :tickets, class_name: "Ticket"
   has_and_belongs_to_many :attended_events, class_name: "Event", dependent: :destroy
   after_create  :after_create_mail

   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    validates :name, presence: true

  enum role: [:organizer,:attender]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  private

  def after_create_mail
    CrudNotificatonMailer.welcome(self).deliver_now
  end
  
end
