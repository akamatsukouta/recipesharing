class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/cookings/#{@comment.cooking.id}"
    else
      render "cookings/show"
    end
  end

  def show
    @comments = Comment.all
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :comment).merge(user_id: current_user.id, cooking_id: params[:cooking_id])
  end
end
