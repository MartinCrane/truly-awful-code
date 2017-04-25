class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_account

  def authenticate
    redirect_to root_path, alert: "You must be logged in to perform that action" unless logged_in?
  end

  def logged_in?
    !!current_account
  end

  def current_account
    return false unless session[:account_id]
    Account.find(session[:account_id])
  end
end
