class CategoriesController < ApplicationController

  def new
    binding.pry

    @cafe = Cafe.find_by(id: params[:cafe_id])
    if @cafe
      @categories = Category.all
      @category = Category.new
    else
      flash[:message] = ["Please choose a cafe to create a new category."]
      redirect_to cafes_path
    end
  end

  def create
    binding.pry
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
    params.require(:category).permit(:name, :cafe_ids => [])
  end
end

# <% @categories.each do |cat| %>
#   <%= check_box_tag("cafe[category][]", cat.id) %>
#   <%= cat.name %><br>
# <% end %>
