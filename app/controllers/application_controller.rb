class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  
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
end
