class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    #set user
    @user = User.find(params[:calificated_user])
    #raise
    @review = Review.new(review_params)
    @review.user = @user
    # @review.rating = params[:review][:rating].to_i
    if @review.save
       redirect_to teacher_path(@user), notice: 'Revisión creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = Review.find(params[:id])
    @review. destroy
    redirect_to reviews_path, notice: 'Revisión eliminada exitosamente';
  end

  private

  def review_params
    params.require(:review).permit(:comments, :rating)
  end
end
