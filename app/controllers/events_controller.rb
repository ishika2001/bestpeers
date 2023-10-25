class EventsController < ApplicationController
  # before_action :current_event, only: [:show, :edit, :update, :destroy]

  def index 
    @events = Event.all
  end
 
  def new
    @event = Event.new
  end

  def create
    if user_signed_in?
      @organizer = Organizer.find(params[:event][:organizer_id])
      # @organizer = Organizer.find_by(id: current_user) 
      # @organizer = Organizer.find_by(id: current_user.id) 
    end
    puts ">>>>>>>>>>>>..#{@organizer}"
    @event = @organizer.events.create(event_params)
    if @event.save
      redirect_to organizer_path(@organizer)
    else
      render :dashboard, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :time, :venue, :description)
    end

    def current_event
      @event = Event.find(params[:id])
    end
end








 # def destroy
  #   @organizer = Event.find(params[:organizer_id])
  #   @event = @organizer.events.find(params[:id])
  #   @event.destroy
  #   redirect_to organizer_path(@organizer), status: :see_other
  # end

  # def update 
  #   @event = Event.find_by(id:params[:id])
  #   if @event.update(event_params)
  #           redirect_to @event
  #   # else 
  #   #   render :edit 
  #   end
  # end


   
  # def update
  #   @event.update(event_params)

  #   redirect_to event_path(@event)
  # end

  # def destroy
  #   @event.destroy

  #   redirect_to events_path
  # end
 