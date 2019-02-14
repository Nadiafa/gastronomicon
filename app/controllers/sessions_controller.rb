class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]
  
  def new
  end

  def create
    if auth
      oauth_uid = auth["uid"]
      oauth_username = auth["info"]["nickname"]
      oauth_password = SecureRandom.hex
      if user = User.find_by(uid: oauth_uid)
        session[:user_id] = user.id
        flash[:message] = "You have successfully logged in"
        redirect_to user_path(user)
      else
        user = User.new(uid: oauth_uid, username: oauth_username, password: oauth_password)
        if user.save
          session[:user_id] = user.id
          flash[:message] = "You have successfully logged in"
          redirect_to user_path(user)
        else 
          flash[:message] = "Something went wrong"
          redirect_to root_path
        end
      end 
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "You have successfully logged in"
        redirect_to user_path(@user)
      else
        flash[:message] = "Something went wrong"
        redirect_to root_path
      end
    end 
  end

  def destroy
    session.clear
    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end

  private
  
  def auth 
    request.env['omniauth.auth']
  end 
end