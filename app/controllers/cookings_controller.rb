class CookingsController < ApplicationController
  def index
    @cookings = Cooking.order("created_at DESC")
  end

  def new
    @cooking = Cooking.new
  end

  def create
    @cooking = Cooking.new(cooking_params)
    @cooking.user_id = current_user.id
    if @cooking.save
      redirect_to root_path   
    else
      render :new
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  def edit
    @cooking = Cooking.find(params[:id])
  end
     
  def update
    cooking = Cooking.find(params[:id])
    cooking.update(cooking_params)
  end

  def destroy
    cooking = Cooking.find(params[:id])
    cooking.destroy
    redirect_to root_path
  end

  def search
    @cookings = Cooking.search(params[:keyword])
  end

  private
  def cooking_params
    params.require(:cooking).permit(:cooking_name, :material, :recipe, :point1, :point2, :point3, :production_time, images:[]).merge(user_id: current_user.id)
  end
  
end
