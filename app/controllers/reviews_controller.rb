class ReviewsController < ApplicationController
 def new
  @review = Review.new
  @user = current_user
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.user = @user
    # @review.rating = params[:review][:rating].to_i
    if @review.save
      redirect_to root_path, notice: 'Revisión creada exitosamente.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comments, :rating)
  end
end
<<<<<<< HEAD
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
=======
end


# despues de hacer le push de la rama entonces se
# git co master = eso hace que llegue a la rama
# git pull
>>>>>>> f122c29ecd9423c7b6f93eac6e38252a403e4f60
