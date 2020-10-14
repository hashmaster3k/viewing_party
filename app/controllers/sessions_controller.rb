class SessionsController < ApplicationController
  include SessionsHelper
  def create
    create_session
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end
end
