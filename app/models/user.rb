class User < ApplicationRecord
   has_many :events, class_name: "Event", foreign_key: "organizer_id"
  #  has_one :ticket, class_name: "Ticket"
   has_and_belongs_to_many :attended_events, class_name: "Event"


  enum role: [:organizer,:attender]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def index 
    @users = User.all
  end
  
end
