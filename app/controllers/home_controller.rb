class HomeController < ApplicationController
  # layout "home"
  # before_action :authenticate_event_organizer!
  # skip_before_action :authenticate_event_organizer!, only: %i[index]

  def index 
    @events = Event.all
    if user_signed_in?
      if current_user.role == "attender"
        render "/users/attender_dashboard"
      else 
        render "/users/organizer_dashboard"
      end
    end
  end
end
