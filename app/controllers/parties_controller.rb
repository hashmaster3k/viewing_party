class PartiesController < ApplicationController
  def new; end

  def create
    party = Party.create(party_params)
    if params[:friends].count > 0
      params[:friends].each do |friend|
        party.user_parties.create(host_id: current_user.id, invitee_id: friend.to_i)
      end
    else
      party.user_parties.create(host_id: current_user.id, invitee_id: 0)
    end
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:movie_id, :movie_title, :duration, :date, :time, :friends)
  end
end
