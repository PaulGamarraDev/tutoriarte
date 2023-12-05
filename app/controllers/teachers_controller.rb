class TeachersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end
end
