class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:message] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def require_login
    if !helpers.logged_in?
      flash[:message] = ["Please log in or sign up to see this info"]
      redirect_to root_path
    end
  end
end
