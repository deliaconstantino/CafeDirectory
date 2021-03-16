class ReviewsController < ApplicationController
  def index
    if params[:cafe_id]
      @reviews = Review.where(cafe_id: params[:cafe_id])
    else
      redirect_to cafes_path
    end
  end

  def new
    if !(@cafe = Cafe.find_by(id: params[:cafe_id]))
      flash[:message] = ["You can only review an existing cafe."]
      redirect_to cafes_path
    else
      @review = Review.new(cafe_id: @cafe.id)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = helpers.current_user

    if @review.save
      redirect_to cafe_path(@review.cafe)
    else
      @cafe = Cafe.find_by(id: params[:review][:cafe_id])
      flash.now[:message] = @review.errors.full_messages
      render :new
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
    if @review && @review.user == helpers.current_user
      render :show
    else
      redirect_to cafes_path
    end

  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review && @review.user == helpers.current_user
        @review.destroy
        redirect_to user_path(helpers.current_user)
    else
      redirect_to cafes_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :cafe_id)
  end

end
