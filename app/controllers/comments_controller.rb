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

  
end
