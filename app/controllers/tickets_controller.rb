class TicketsController < ApplicationController
  def index 
    @tickets = Ticket.all
  end

  def show
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @user = current_user

    @ticket = @user.tickets.create(ticket_params)
    redirect_to @ticket
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
