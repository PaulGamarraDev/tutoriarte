class TeachersController < ApplicationController
  def index
    @users = User.all
    @subjects = Subject.where(user_id: user.id)
  end

  def show
    @user = User.find(params[:id])
    @subjects = Subject.where(user_id: params[:id])
    @reviews = Review.where(user_id: params[:id])
  end
end
