class ReviewsController < ApplicationController
  def new
    if !(@cafe = Cafe.find_by(id: params[:cafe_id]))
      flash[:message] = ["You can only review an existing cafe."]
      redirect_to cafes_path
    else
      @review = Review.new(cafe_id: @cafe.id)
    end
  end

  def create
    # @review = Review.new(review_params)
    # @review.user = helpers.current_user

    # if @review.save
    #   redirect_to review_path(@review)
    # else
    #   flash[:message] = ['That did not work. Please try again.']
    #   redirect_to cafes_path
    # end
  end

  def show
    # raise params.inspect
    # if params[:id] == "new"
    #   flash[:message] = ["Please choose a cafe to review."]
    #   redirect_to cafes_path
    # else
    #   @review = Review.find_by(id: params[:id])
    # end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :cafe_id)
  end
end
