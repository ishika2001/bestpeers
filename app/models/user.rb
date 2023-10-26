class User < ApplicationRecord

has_many :events

  enum role: [:organizer,:attender]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  #Ex:- :default =>''

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def index 
    @users = User.all
  end

  
end
