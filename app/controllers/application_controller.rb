class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :admin


  def authenticate
    unless current_user
      redirect_to login_path, notice: "You are not signed in."
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin
    current_user.admin if current_user
  end

  def admin_authenticate
    redirect_to user_path(@user) unless admin
  end



#     def correct_user
#       @user = User.find(params[:id])
#       @user == current_user
#     end
#
end
