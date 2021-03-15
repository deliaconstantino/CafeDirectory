class CafesController < ApplicationController
  def index
    @cafes = Cafe.all
  end

  def new
    @cafe = Cafe.new
    render :edit
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
    @cafe = Cafe.find_by(id: params[:id])
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

  private

  def cafe_params
    params.require(:cafe).permit(:name, :city, :state, :speciality, :table_chair_seating, :cushioned_seating, :outdoor_seating, :wifi, :food, :open_hour, :open_minute, :close_hour, :close_minute)
  end
end
