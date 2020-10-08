class FriendsController < ApplicationController
  def create
    if (friend = User.find_by(email: params[:email]))
      current_user.followers << friend
    else
      flash[:error] = "I'm sorry your friend cannot be found"
    end
    redirect_to dashboard_path
  end
end
