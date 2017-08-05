class ReviewsController < ApplicationController

    def new
      before_filter  :authorize,  only: [:create, :destroy]
      redirect_to "/"
    end

    def create

      @review = Review.new(
      rating: review_params[:rating],
      description: review_params[:description],
      user_id: current_user.id,
      product_id: params["product_id"]
      )
        if @review.save

          redirect_to product_path(@review.product), notice: "Review created!"
        else
          @product = @review.product
          @reviews = @product.reviews
          puts "comment did not save"
          render "products/show"
        end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to product_path(@review.product), notice: 'Review has been deleted!'
    end

     private

    def review_params
      params.require(:review).permit(:description, :rating, :product_id)
    end
end
