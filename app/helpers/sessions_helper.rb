module SessionsHelper
  def create_session
    if (user = User.find_by(email: params[:email]))
      user_authenticate(user)
    else
      flash[:error] = 'Credentials are incorrect'
      redirect_to root_path
    end
  end

  def user_authenticate(user)
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Credentials are incorrect'
      redirect_to root_path
    end
  end
end
