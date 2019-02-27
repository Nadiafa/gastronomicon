class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You have successfully logged in"
      redirect_to user_path(@user)
    else
      render :new
    end 
  end

  def show
    @user = User.find_by(id: params[:id])
  end 

  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
