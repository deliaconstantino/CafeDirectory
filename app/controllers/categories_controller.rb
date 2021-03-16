class CategoriesController < ApplicationController

  def new
    # binding.pry
    if @cafe = Cafe.find_by(id: params[:cafe_id])
      @category = Category.new
    else
      flash[:message] = ["Please choose a cafe to create a new category."]
      redirect_to cafes_path
    end
  end

  def create
    # binding.pry
    @category = Category.new(category_params)
    @cafe = Cafe.find_by(id: params[:cafe_id])

    if @category.save && @category.cafes << @cafe
      redirect_to cafe_path(@cafe)
    else
      flash.now[:message] = @category.errors.full_messages
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
