class CafesController < ApplicationController
  def index
  end

  def new
    @cafe = Cafe.new
  end

  def create
    raise params.inspect
  end

  def show
  end
end
