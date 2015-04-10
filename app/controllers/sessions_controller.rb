class SessionsController < MarketingController

  def new
    @user = User.new
  end

def create
  user = User.find_by_email(params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    if session[:previous_path]
      redirect_to session[:previous_path]
    elsif
      redirect_to projects_path, notice: 'Welcome back, stranger!'
  else
    @sign_in_error = "Username / password combination is invalid"
    render :new
    end
  end
end

  def destroy
    session.clear
    redirect_to root_path, notice: "We're sorry to see you go!"
  end
end
