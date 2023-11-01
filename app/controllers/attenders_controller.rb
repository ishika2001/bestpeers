class AttendersController < ApplicationController
  def index 
    @users = User.all.where(role: 1)
  end

  def show
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
  end

  def new
    @user = User.new
  end

 
end
