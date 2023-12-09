class TeachersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @subjects = Subject.where(user_id: params[:id])
    @reviews = Review.where(user_id: params[:id])
  end
end
