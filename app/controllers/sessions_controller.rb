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
        # redirect_to root_path
        flash[:message] = "You have successfully logged in"
        redirect_to user_path(user)
      else
        # user = User.new(uid: oauth_uid, username: auth["info"]["nickname"], password: SecureRandom.hex)
        user = User.new(uid: oauth_uid, username: oauth_username, password: oauth_password)
        if user.save
          session[:user_id] = user.id
          flash[:message] = "You have successfully logged in"
          redirect_to user_path(user)
        else 
          raise user.errors.full_messages.inspect
        end
      end 
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "You have successfully logged in"
        redirect_to user_path(@user)
      else
        flash[:message] = "Something went wrong."
        redirect_to root_path
      end
    end 
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
  
  def auth 
    request.env['omniauth.auth']
  end 
end


# <OmniAuth::AuthHash 
#   info=#<OmniAuth::AuthHash::InfoHash 
#     email=nil 
      # image="https://avatars3.githubusercontent.com/u/30985274?v=4" 
#     name="Nadia" 
#     nickname="Nadiafa" 
#     urls=#<OmniAuth::AuthHash Blog="" GitHub="https://github.com/Nadiafa">
#   > 
#   provider="github" 
#   uid="30985274"
# >
