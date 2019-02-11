class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :redirect_if_not_logged_in
  
  def home
    @recipes = Recipe.all
  end 

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end 

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:message] = "You are not logged in. Please Sign Up or Log In to continue."
      redirect_to root_path
    end
  end 
end
