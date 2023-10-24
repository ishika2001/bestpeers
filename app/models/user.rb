class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # enum role: [:organizer, :attender]
  enum role: {organizer: 'organizer', attender: 'attender'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :type_of_user

  def index 
    @users = User.all
  end


  def type_of_user
    if user_signed_in?
      if current_user.role == "attender"
            belongs_to :event
      else 
           has_many :events
      end
    end
  end

  
end
