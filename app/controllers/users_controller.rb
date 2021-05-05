class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cookings = @user.cookings.includes(:user)
  end
end
