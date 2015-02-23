class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  def current_user
    User.find_by_id(session[:user_id])
  end

  def authenticate
    if not current_user
      redirect_to login_path, notice: "You are not signed in."
    end
  end
  helper_method :current_user
end
