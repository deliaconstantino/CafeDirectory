class CafesController < ApplicationController
  before_action :require_login

  def index
    if params[:f] && !params[:f].empty?
      @cafes = Cafe.filter_by_state(params[:f])
    elsif params[:q] && !params[:q].empty?
      @cafes = Cafe.search(params[:q].downcase)
      flash.now[:message] = ["We could not find content with #{params[:q]}"] if @cafes.empty?
    else
      @cafes = Cafe.all
   end
  end

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to cafe_path(@cafe)
    else
      flash.now[:message] = @cafe.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id] == "highly_rated"
      @cafe = Cafe.highly_rated
    else
      @cafe = Cafe.find_by(id: params[:id])
    end
  end

  def edit
    @cafe = Cafe.find_by(id: params[:id])
  end

  def update
    @cafe = Cafe.find_by(id: params[:id])
      if @cafe.update(cafe_params)
        redirect_to cafe_path(@cafe)
      else
        flash.now[:message] = @cafe.errors.full_messages
        render :edit
      end
  end

  def accept
    @cafe = Cafe.find_by(id: params[:cafe_id])
    @category = @cafe.categories.build
    @categories = Category.all
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name, :city, :state, :speciality, :table_chair_seating, :cushioned_seating, :outdoor_seating, :wifi, :food, :open_hour, :open_minute, :close_hour, :close_minute,  category_attributes: [:name], :category_ids => [])
  end

  def require_login
    if !helpers.logged_in?
      flash[:message] = ["Please log in or sign up to see this info"]
      redirect_to root_path
    end
  end

end
