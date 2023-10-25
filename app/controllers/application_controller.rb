class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if user_signed_in?
      if current_user.role == "attender"
        attender_dashboard_path
      else 
        organizers_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(  :email, :name,:password, :password_confirmation,:role) }
  end

  
end
