class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(cooking_id: params[:cooking_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cooking = Cooking.find(params[:cooking_id])
    @like = Like.find_by(cooking_id: @cooking.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
