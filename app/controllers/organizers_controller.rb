class OrganizersController < ApplicationController
  before_action :current_organizer, only: [:show, :edit, :update, :destroy]

  def index
    @organizers = User.all.where(role: "organizer")
  end

  def show

  end

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.create(organizer_params)

    redirect_to organizer_path(@organizer)
  end

  def edit

  end

  def update
    @organizer.update(organizer_params)

    redirect_to organizer_path(@organizer)
  end

  def destroy
    @organizer.destroy

    redirect_to organizers_path
  end

  private
  def organizer_params
    params.require(:organizer).permit( :email,:name, :password, :password_confirmation, :role)
  end

  def current_organizer
    @organizer = Organizer.find(params[:id])
  end
end

#   before_action :current_organizer, only: [:show, :edit, :update, :destroy]

#   def index
#     @organizers = Organizer.all.where(role: "organizer")
#   end

#   def show
#     @organizer = Organizer.find(params[:id])
#   end

#   def new
#     @organizer = Organizer.new
#   end

  
#   def create
#     @organizer = Organizer.create(organizer_params)

#     redirect_to organizer_path(@organizer)
#   end


#   # def create
#   #   @organizer = Organizer.create(organizer_params)    
#   #   if @organizer.save
#   #     redirect_to @organizer
#   #   # else
#   #   #   render :new, status: :unprocessable_entity
#   #   end
#   # end

 
#   def edit
#     @organizer = Organizer.find(params[:id])
#   end


#   def update
#     @organizer = Organizer.find(params[:id])

#     if @organizer.update(organizer_params)
#       redirect_to @organizer
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @organizer = Organizer.find(params[:id])
#     @organizer.destroy
#     redirect_to root_path, status: :see_other
#   end

#   private
#   def organizer_params
#     params.require(:organizer).permit(:name,  :email, :password, :password_confirmation)
#   end

#   def current_organizer
#     @organizer = Organizer.find(params[:id])
#   end
  
# end
