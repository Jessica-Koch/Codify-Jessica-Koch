class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, stranger!"
    else
      login_error = "Username / passowrd combination is invalid"
      render :new
    end
  end




    def destroy
      session.clear
      redirect_to root_path, notice: "We're sorry to see you go!"
    end

end
