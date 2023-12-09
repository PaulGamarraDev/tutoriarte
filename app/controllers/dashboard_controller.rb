class DashboardController < ApplicationController
  before_action :authenticate_user!
 def index
    @user = @current_user
    @reviews = @user.review
    @Booking = @user.bookings
  end
 private

  def set_user
    @user = current_user
  end
end