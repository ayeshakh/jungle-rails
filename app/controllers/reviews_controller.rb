class ReviewsController < ApplicationController

  def new
    def new
    before_filter  :authorize,  only: [:create, :destroy]

      redirect_to "/" unless current_admin || current_company
      flash[:notice] = 'You dont have enough permissions to be here' unless current_admin || current_company

     end
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
     @review.user = current_user
      @review.save
        if @review.save
          flash[:success] = "Review created!"
          redirect_to "/products/" + params[:product_id]
        else
          flash[:failure] = "Try Again"
          redirect_to "/"
        end

  end

  private

    def review_params
      params.require(:review).permit(:description, :rating, :product_id)
    end

end
