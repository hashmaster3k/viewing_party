class FriendsController < ApplicationController
  def create
    if friend = User.find_by(email: params[:email])
      current_user.followers << friend
      redirect_to dashboard_path
    else
      flash[:error] = "I'm sorry your friend cannot be found"
      redirect_to dashboard_path
    end
  end
end
