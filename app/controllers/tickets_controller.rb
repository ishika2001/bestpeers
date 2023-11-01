class TicketsController < ApplicationController
  def index 
    @tickets = Ticket.all
  end

  def show
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets
    @booked = 0
    @unbooked = 0
    @ticket.each do|t|
      if t.status=="not-booked"
        @unbooked+=1
      else
        @booked+=1
      end
    end
  end

  def new
    @ticket = Ticket.new
  end


  def create
    @user = current_user
    if @user.role == "organizer"
      @ticket = @user.tickets.create(ticket_params)
      redirect_to @ticket
    else
      flash[:error] = "You must have the organizer role to create tickets."
      redirect_to root_path
    end
  end

  def book
    @user = current_user
    puts "<<<<<<<<<<<<<<<<<#{@user}"
    @ticket = Ticket.find_by(id: params[:id])
    puts @ticket.status=="not-booked"
    if @ticket
        if @ticket.status=="not-booked"
          @user.tickets<<@ticket
          @ticket.status = "booked"
          if @ticket.save
            flash[:success] = "Ticket booked count updated."
          else
            flash[:error] = "Failed to update Ticket booked count."
          end
        end
    else
      flash[:error] = "Ticket record not found."
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def ticket_params
      params.require(:ticket).permit(:name, :price)
    end

end
