class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  # def configure_sign_up_params 
  #   devise_parameters_sanitizer.permit(:sign_up, keys: [:role])
  # end

  # def create 
  #   super do |user|
  #     user.role =param[:user][:role]
  #     user.save
  #   end
  # end
end
