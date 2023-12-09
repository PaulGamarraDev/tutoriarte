class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # hola soy un commet
 def new
  @review = Review.new
  # @teachers = User.where(role:2)
  # # seria el dos
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.user = @user

    if @review.save
       redirect_to teacher_path(@review.teacher), notice: 'Revisión creada exitosamente.'
    else
      @teacher = User.where.all
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = Review. find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: 'Revisión eliminada exitosamente';
  end

  private

  def review_params
    params.require(:review).permit(:teacher_id, :comments, :rating)
  end

  def teacher
    @teacher = Teacher.all

  end
end
