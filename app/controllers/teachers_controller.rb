class TeachersController < ApplicationController
  def index
    @users = User.all
<<<<<<< HEAD
    @subjects = Subject.where(user_id: user.id)
=======
    @subjects = Subject.all
>>>>>>> 853bef5c7f3690e6ffc2e7e0bfc5791a3bf106c5
  end

  def show
    @user = User.find(params[:id])
    @subjects = Subject.where(user_id: params[:id])
    @reviews = Review.where(user_id: params[:id])
  end
end
