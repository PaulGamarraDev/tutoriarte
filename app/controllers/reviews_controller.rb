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

#   def new
#     @reviews = Review.new
#     # @user = current_user
#     @review.build_professor
#     @review.build_rating
#     @review.build_comment
#   end

#   def create
#     @review = Review.new(review_params)
#     # @user = current_user
#     # @review.user = @user
#     if @review.save
#       # flash[:success] = 'Revisión enviada exitosamente.'
#       # redirect_to root_path
#       redirect_to root_path, notice: 'Revisión enviada exitosamente.'
#     else
#       render 'new'

#       # :unprocessable_entity muestar los errores de LAS VALIDACIONES sobre la forma
#     end
#   end

#   private

#   def review_params
#     params.require(:review).permit(:professor_id, professor_attributes: [:name], rating_attributes: [:value], comment_attributes: [:content])
#   end
# end


# despues de hacer le push de la rama entonces se
# git co master = eso hace que llegue a la rama
# git pull
