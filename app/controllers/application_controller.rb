class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Lets not load this up if we're not accessing through a devise controller because if we access it using every controller we're wasting resources
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # protect the database, while allowing these fields to be updated
  protected
  
  def configure_permitted_parameters
    # On the sign up page you should be able to pass these variables back
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :email, :password, :password_confirmation, :remember_me) }
    # We remove :username from the account update page because we dont want people updating their usernames
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
  end
  
end