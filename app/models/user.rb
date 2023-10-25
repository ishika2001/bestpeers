class User < ApplicationRecord
 
  enum role: {organizer: 'organizer', attender: 'attender'}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def index 
    @users = User.all
  end

  
end
