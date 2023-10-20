class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    organizer_dashboard_path
    # attender_dashboard_path
  end
  # def after_sign_out_path_for(resource)
  #   home_index_path
  # end
end
