class SessionsController < ApplicationController
  include SessionsHelper
  def create
    create_session
  end
end
