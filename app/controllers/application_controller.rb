class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if user_signed_in?
      if current_user.role == nil
        attender_dashboard_path
      else 
        organizer_dashboard_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, role: [:organizer, :attender]])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit({ roles: [:organizer, :attender] }, :name,:email, :password, :password_confirmation)
  #   end
  # end
  # def after_sign_out_path_for(resource)
  #   home_index_path
  # end

  
end
