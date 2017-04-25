class SessionsController < ApplicationController
  def create
    account = Account.find_by(username: safe_session[:username])
    if account && account.authenticate(safe_session[:password])
      session[:account_id] = account.id
      redirect_to root_path, notice: "Sucessfully Logged in."
    else
      redirect_to root_path, alert: "Bad username or password"
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path, notice: "Sucessfully Logged out."
  end

  def safe_session
    params.require(:session).permit(:username, :password)
  end
end
