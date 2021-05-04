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
end
