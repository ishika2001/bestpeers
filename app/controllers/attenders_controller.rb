class AttendersController < ApplicationController
  def index 
    @attenders = User.all.where(role: 1)
  end

  def show
    # @attender = User.find(params[:id])
    @event = Event.find(params[:id])
  end

  def new
    @attender = User.new
  end

  def create
    @user = current_user
    @attender = @user.attenders.create(attender_params)
    redirect_to @attender
  end

  def edit
    @attender = User.find(params[:id])
  end

  def update
    @attender = User.find(params[:id])

    if @attender.update(attender_params)
      redirect_to @attender
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @attender = User.find(params[:id])
    @attender.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def attender_params
      params.require(:attender).permit(:title, :date, :time, :venue, :description)
    end

end
