class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @review.user = @user
    if @review.save
      flash[:success] = 'Revisión enviada exitosamente.'
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
      # :unprocessable_entity muestar los errores de LAS VALIDACIONES sobre la forma
    end
  end

  private

  def review_params
    params.require(:review).permit(:comments, :rating)
  end
end
end
