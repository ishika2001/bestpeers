class AttendersController < ApplicationController
  def index 
    @attenders = Attender.all
  end

  def show
    @attender = Attender.find(params[:id])
    @event = Event.find(params[:id])
  end

  def new
    @attender = Attender.new
  end

  def create
    @user = current_user

    @attender = @user.attenders.create(attender_params)
    redirect_to @attender
  end

  def edit
    @attender = Attender.find(params[:id])
  end

  def update
    @attender = Attender.find(params[:id])

    if @attender.update(attender_params)
      redirect_to @attender
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @attender = Attender.find(params[:id])
    @attender.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def attender_params
      params.require(:attender).permit(:title, :date, :time, :venue, :description)
    end

end
