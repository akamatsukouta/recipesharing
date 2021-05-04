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

  private
  def cooking_params
    params.require(:cooking).permit(:cooking_name, :material, :recipe, :point1, :point2, :point3, :production_time, images:[]).merge(user_id: current_user.id)
  end
  
end
