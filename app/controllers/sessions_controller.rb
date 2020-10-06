class SessionsController < ApplicationController
  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/user/dashboard'
      else
        flash[:error] = "Credentials are incorrect"
        redirect_to '/'
      end
    else
      flash[:error] = "Credentials are incorrect"
      redirect_to '/'
    end
  end
end
