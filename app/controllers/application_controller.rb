class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
end

def authenticate
  if not current_user
    redirect_to login_path, notice: "You are not signed in."
  end
end

  def current_user
    User.find_by(id: session[:user_id])
  end
