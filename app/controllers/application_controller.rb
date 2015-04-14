class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :authenticate
    helper_method :correct_user
    helper_method :admin?
    helper_method :owner?
    helper_method :admin_authenticate
    helper_method :logged_in
    helper_method :not_found

  def current_user
    User.find_by_id(session[:user_id])
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    unless current_user
      session[:previous_path] = request.fullpath
      redirect_to login_path, notice: "You are not signed in."
    end
  end

  def admin?
    current_user.admin == true
  end

  def owner?
    @project.users.include?(current_user) && current_user.memberships.find_by(project_id: @project).owner?
  end

  def admin_authenticate
    redirect_to user_path(@user) unless admin
  end

  def logged_in
    unless logged_in?
      redirect_to login_path
    end
  end

  def not_found
    # render :file => 'public/404.html', :status => :not_found, :layout => false
  end


end
