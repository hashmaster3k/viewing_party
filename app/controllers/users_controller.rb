class UsersController < ApplicationController
  def new; end

  def create
    if params[:password_confirm] == params[:password]
      create_user
    else
      flash[:error] = 'Passwords do not match.'
      render :new
    end
  end

  private

  def create_user
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.first
      render :new
    end
  end

  def user_params
    params.permit(:email, :password)
  end
end
